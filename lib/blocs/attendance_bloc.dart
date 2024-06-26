import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/AttendanceModel.dart';
import 'package:school_app/repositories/attendance_repository.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository repository;

  AttendanceBloc({required this.repository}) : super(AttendanceState()) {
    on<Submit>(_onSubmit);
    on<LoadAttendanceData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadAttendanceData event, Emitter<AttendanceState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getAll();
      emit(state.copyWith(
        currentState: StateTypes.loaded,
        items: items,
        error: null,
      ));
    } catch (ex) {
      emit(state.copyWith(
        currentState: StateTypes.error,
        error: "Error: ${ex}",
      ));
    }
  }


  Future<void> _onSubmit(Submit event, Emitter<AttendanceState> emit) async {
    emit(state.copyWith(currentState: StateTypes.submitting));
    try {
      var res = await repository.add(event.model);
      if (res) {
        emit(state.copyWith(
            currentState: StateTypes.submitted,
            error: null
        ));
      } else {
        emit(state.copyWith(
            currentState: StateTypes.error,
            error: "Error: Adding Field"
        ));
      }
    } catch (ex) {
      emit(
          state.copyWith(
              currentState: StateTypes.error,
              error: "Exp: ${ex}"
          )
      );
    }
  }
}

class AttendanceState {
  final StateTypes currentState;
  final String? error;
  final List<AttendanceModel> items;

  AttendanceState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  AttendanceState copyWith({
    StateTypes? currentState,
    String? error,
    List<AttendanceModel>? items,
  }) {
    return AttendanceState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class AttendanceEvent {}

class Submit extends AttendanceEvent {
  final AttendanceModel model;

  Submit(this.model);
}

class LoadAttendanceData extends AttendanceEvent {}

