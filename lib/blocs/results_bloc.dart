import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/ResultsModel.dart';
import 'package:school_app/repositories/results_repository.dart';


class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final ResultsRepository repository;

  ResultBloc({required this.repository}) : super(ResultState()) {

    on<FetchResultsItemsBySubjectId>(_onFetchResultsItemsBySubjectId);
  }

  Future<void> _onFetchResultsItemsBySubjectId(FetchResultsItemsBySubjectId event, Emitter<ResultState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getBySubject(event.subjectId);
      emit(state.copyWith(
          currentState: StateTypes.loaded,
          items: items,
          error: null
      ));
    } catch (ex) {
      emit(
          state.copyWith(
              currentState: StateTypes.error,
              error: "Error: ${ex}"
          )
      );
    }
  }


}

class ResultState {
  final StateTypes currentState;
  final String? error;
  final List<ResultsModel> items;

  ResultState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  ResultState copyWith({
    StateTypes? currentState,
    String? error,
    List<ResultsModel>? items
  }) {
    return ResultState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class ResultEvent {}

class Submit extends ResultEvent {
  final ResultsModel model;

  Submit(this.model);
}

class FetchResultsItemsBySubjectId extends ResultEvent {
  final int subjectId;

  FetchResultsItemsBySubjectId({required this.subjectId});
}
