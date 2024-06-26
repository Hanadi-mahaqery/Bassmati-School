import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/InComeMeetingModel.dart';
import 'package:school_app/repositories/meeting_repository.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  final MeetingRepository repository;

  MeetingBloc({required this.repository}) : super(MeetingState()) {
    on<FetchMeetingItemsByStatues>(_onFetchMeetingItemsByStatues);
  }

  Future<void> _onFetchMeetingItemsByStatues(FetchMeetingItemsByStatues event, Emitter<MeetingState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getByStatues(event.meetStatues);
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

class MeetingState {
  final StateTypes currentState;
  final String? error;
  final List<MeetingModel> items;

  MeetingState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  MeetingState copyWith({
    StateTypes? currentState,
    String? error,
    List<MeetingModel>? items
  }) {
    return MeetingState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class MeetingEvent {}

class FetchMeetingItemsByStatues extends MeetingEvent {
  final int meetStatues;

  FetchMeetingItemsByStatues({required this.meetStatues});
}
