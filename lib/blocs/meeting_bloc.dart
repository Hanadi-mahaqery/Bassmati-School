import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/MeetingModel.dart';
import 'package:school_app/repositories/meeting_repository.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  final MeetingRepository repository;

  MeetingBloc({required this.repository}) : super(MeetingState()) {
    on<Submit>(_onSubmit);
    on<LoadMeetingData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadMeetingData event, Emitter<MeetingState> emit) async {
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


  Future<void> _onSubmit(Submit event, Emitter<MeetingState> emit) async {
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

class MeetingState {
  final StateTypes currentState;
  final String? error;
  final List<ExamScheduleModel> items;

  MeetingState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  MeetingState copyWith({
    StateTypes? currentState,
    String? error,
    List<ExamScheduleModel>? items,
  }) {
    return MeetingState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class MeetingEvent {}

class Submit extends MeetingEvent {
  final ExamScheduleModel model;

  Submit(this.model);
}

class LoadMeetingData extends MeetingEvent {}

