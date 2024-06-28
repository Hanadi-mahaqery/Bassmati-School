import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/ExamScheduleModel.dart';
import 'package:school_app/repositories/examSchedule_repository.dart';

class ExamScheduleBloc extends Bloc<ExamScheduleEvent, ExamScheduleState> {
  final ExamScheduleRepository repository;

  ExamScheduleBloc({required this.repository}) : super(ExamScheduleState()) {
    on<Submit>(_onSubmit);
    on<LoadExamScheduleData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadExamScheduleData event, Emitter<ExamScheduleState> emit) async {
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


  Future<void> _onSubmit(Submit event, Emitter<ExamScheduleState> emit) async {
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

class ExamScheduleState {
  final StateTypes currentState;
  final String? error;
  final List<ScheduleModel> items;

  ExamScheduleState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  ExamScheduleState copyWith({
    StateTypes? currentState,
    String? error,
    List<ScheduleModel>? items,
  }) {
    return ExamScheduleState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class ExamScheduleEvent {}

class Submit extends ExamScheduleEvent {
  final ScheduleModel model;

  Submit(this.model);
}

class LoadExamScheduleData extends ExamScheduleEvent {}

