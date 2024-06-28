import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/TaskHwModel.dart';
import 'package:school_app/repositories/taskHw_repository.dart';

class TaskHwBloc extends Bloc<TaskHwEvent, TaskHwState> {
  final TaskHwRepository repository;

  TaskHwBloc({required this.repository}) : super(TaskHwState()) {
    on<LoadTaskData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadTaskData event, Emitter<TaskHwState> emit) async {
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
        error: "Error: $ex",
      ));
    }
  }
}

class TaskHwState {
  final StateTypes currentState;
  final String? error;
  final List<TaskHWModel> items;

  TaskHwState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  TaskHwState copyWith({
    StateTypes? currentState,
    String? error,
    List<TaskHWModel>? items,
  }) {
    return TaskHwState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class TaskHwEvent {}

class Submit extends TaskHwEvent {
  final TaskHWModel model;

  Submit(this.model);
}

class LoadTaskData extends TaskHwEvent {}
