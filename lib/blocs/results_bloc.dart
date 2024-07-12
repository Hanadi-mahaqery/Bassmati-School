import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/ResultsModel.dart';
import 'package:school_app/repositories/results_repository.dart';


class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final ResultsRepository repository;

  ResultBloc({required this.repository}) : super(ResultState()) {

    on<FetchResultsItemsByMonthId>(_onFetchResultsItemsBySubjectId);
  }

  Future<void> _onFetchResultsItemsBySubjectId(FetchResultsItemsByMonthId event, Emitter<ResultState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getByMonth(event.monthId);
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

class FetchResultsItemsByMonthId extends ResultEvent {
  final int monthId;

  FetchResultsItemsByMonthId({required this.monthId});
}
