import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/LibraryModel.dart';
import 'package:school_app/repositories/library_repository.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final LibraryRepository repository;

  LibraryBloc({required this.repository}) : super(LibraryState()) {
    on<Submit>(_onSubmit);
    on<FetchLibraryItemsBySubjectId>(_onFetchLibraryItemsBySubjectId);
  }

  Future<void> _onFetchLibraryItemsBySubjectId(FetchLibraryItemsBySubjectId event, Emitter<LibraryState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getBySession(event.subjectId);
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

  Future<void> _onSubmit(Submit event, Emitter<LibraryState> emit) async {
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

class LibraryState {
  final StateTypes currentState;
  final String? error;
  final List<LibraryModel> items;

  LibraryState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  LibraryState copyWith({
    StateTypes? currentState,
    String? error,
    List<LibraryModel>? items
  }) {
    return LibraryState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class LibraryEvent {}

class Submit extends LibraryEvent {
  final LibraryModel model;

  Submit(this.model);
}

class FetchLibraryItemsBySubjectId extends LibraryEvent {
  final int subjectId;

  FetchLibraryItemsBySubjectId({required this.subjectId});
}
