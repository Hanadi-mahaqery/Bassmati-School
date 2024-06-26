import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/ScheduleModel.dart';
import 'package:school_app/repositories/schedule_repository.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final ScheduleRepository repository;

  ScheduleBloc({required this.repository}) : super(ScheduleState()) {
    on<LoadScheduleData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadScheduleData event, Emitter<ScheduleState> emit) async {
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



}

class ScheduleState {
  final StateTypes currentState;
  final String? error;
  final List<ScheduleModel> items;

  ScheduleState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  ScheduleState copyWith({
    StateTypes? currentState,
    String? error,
    List<ScheduleModel>? items,
  }) {
    return ScheduleState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class ScheduleEvent {}

class Submit extends ScheduleEvent {
  final ScheduleModel model;

  Submit(this.model);
}

class LoadScheduleData extends ScheduleEvent {}

