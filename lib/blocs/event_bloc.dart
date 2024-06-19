import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/EventModel.dart';
import 'package:school_app/repositories/event_repository.dart';

class EventBloc extends Bloc<EventsEvent, EventState> {
  final EventRepository repository;

  EventBloc({required this.repository}) : super(EventState()) {
    on<Submit>(_onSubmit);
    on<LoadEventData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadEventData event, Emitter<EventState> emit) async {
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


  Future<void> _onSubmit(Submit event, Emitter<EventState> emit) async {
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

class EventState {
  final StateTypes currentState;
  final String? error;
  final List<EventModel> items;

  EventState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  EventState copyWith({
    StateTypes? currentState,
    String? error,
    List<EventModel>? items,
  }) {
    return EventState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class EventsEvent {}

class Submit extends EventsEvent {
  final EventModel model;

  Submit(this.model);
}

class LoadEventData extends EventsEvent {}

