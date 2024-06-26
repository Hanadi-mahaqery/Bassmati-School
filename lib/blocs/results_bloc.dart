import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/ResultsModel.dart';
import 'package:school_app/repositories/results_repository.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final ResultsRepository repository;

  ResultsBloc({required this.repository}) : super(ResultsState()) {
    on<LoadResultsData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadResultsData event, Emitter<ResultsState> emit) async {
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

class ResultsState {
  final StateTypes currentState;
  final String? error;
  final List<ResultsModel> items;

  ResultsState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  ResultsState copyWith({
    StateTypes? currentState,
    String? error,
    List<ResultsModel>? items,
  }) {
    return ResultsState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class ResultsEvent {}

class Submit extends ResultsEvent {
  final ResultsModel model;

  Submit(this.model);
}

class LoadResultsData extends ResultsEvent {}

