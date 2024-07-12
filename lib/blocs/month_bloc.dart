import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/MonthModel.dart';

import '../repositories/month_repository.dart';

class MonthBloc extends Bloc<MonthEvent, MonthState> {
  final MonthRepository repository;

  MonthBloc({required this.repository}) : super(MonthState()) {
    on<FetchMonthItemsBySessionName>(_onFetchMonthItemsBySessionName);
  }

  Future<void> _onFetchMonthItemsBySessionName(FetchMonthItemsBySessionName event, Emitter<MonthState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getBySession(event.YearId);
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

class MonthState {
  final StateTypes currentState;
  final String? error;
  final List<MonthModel> items;

  MonthState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  MonthState copyWith({
    StateTypes? currentState,
    String? error,
    List<MonthModel>? items
  }) {
    return MonthState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class MonthEvent {}

class Submit extends MonthEvent {
  final MonthModel model;

  Submit(this.model);
}

class FetchMonthItemsBySessionName extends MonthEvent {
  final int YearId;

  FetchMonthItemsBySessionName({required this.YearId});
}
















