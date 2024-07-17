import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/StuProfModel.dart';
import 'package:school_app/repositories/stuProf_repository.dart';

class StuProfBloc extends Bloc<StuProfEvent, StuProfState> {
  final StuProfRepository repository;

  StuProfBloc({required this.repository}) : super(StuProfState()) {
    on<FetchStudentsItemsByStudentId>(_onFetchStudentItemsByStudentId);
  }

  Future<void> _onFetchStudentItemsByStudentId(FetchStudentsItemsByStudentId event, Emitter<StuProfState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getByStudent(event.StudentId);
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

class StuProfState {
  final StateTypes currentState;
  final String? error;
  final List<StudentProfModel> items;

  StuProfState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  StuProfState copyWith({
    StateTypes? currentState,
    String? error,
    List<StudentProfModel>? items
  }) {
    return StuProfState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class StuProfEvent {}

class FetchStudentsItemsByStudentId extends StuProfEvent {
  final int StudentId;

  FetchStudentsItemsByStudentId({required this.StudentId});
}
