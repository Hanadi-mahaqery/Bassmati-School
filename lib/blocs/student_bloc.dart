import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/StudentModel.dart';
import 'package:school_app/repositories/student_repository.dart';
import 'package:meta/meta.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository repository;

  StudentBloc({required this.repository}) : super(StudentState()) {
    on<Submit>(_onSubmit);
    on<LoadStudentData>(_onLoadData);
    on<Update>(_onUpdate);
    on<Delete>(_onDelete); // إضافة الحدث Delete
  }

  Future<void> _onLoadData(LoadStudentData event, Emitter<StudentState> emit) async {
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

  Future<void> _onSubmit(Submit event, Emitter<StudentState> emit) async {
    emit(state.copyWith(currentState: StateTypes.submitting));
    try {
      var res = await repository.add(event.model);
      if (res) {
        emit(state.copyWith(
          currentState: StateTypes.submitted,
          error: null,
        ));
      } else {
        emit(state.copyWith(
          currentState: StateTypes.error,
          error: "Error: Adding Field",
        ));
      }
    } catch (ex) {
      emit(state.copyWith(
        currentState: StateTypes.error,
        error: "Exp: ${ex}",
      ));
    }
  }

  Future<void> _onUpdate(Update event, Emitter<StudentState> emit) async {
    emit(state.copyWith(currentState: StateTypes.submitting));
    try {
      var res = await repository.update(event.model);
      if (res) {
        emit(state.copyWith(
          currentState: StateTypes.submitted,
          error: null,
        ));
      } else {
        emit(state.copyWith(
          currentState: StateTypes.error,
          error: "Error: Updating Field",
        ));
      }
    } catch (ex) {
      emit(state.copyWith(
        currentState: StateTypes.error,
        error: "Exp: ${ex}",
      ));
    }
  }

  Future<void> _onDelete(Delete event, Emitter<StudentState> emit) async {
    emit(state.copyWith(currentState: StateTypes.submitting));
    try {
      var res = await repository.delete(event.studentId);
      if (res) {
        emit(state.copyWith(
          currentState: StateTypes.submitted,
          error: null,
        ));
      } else {
        emit(state.copyWith(
          currentState: StateTypes.error,
          error: "Error: Deleting Field",
        ));
      }
    } catch (ex) {
      emit(state.copyWith(
        currentState: StateTypes.error,
        error: "Exp: ${ex}",
      ));
    }
  }
}

class StudentState {
  final StateTypes currentState;
  final String? error;
  final List<StudentModel> items;

  StudentState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  StudentState copyWith({
    StateTypes? currentState,
    String? error,
    List<StudentModel>? items,
  }) {
    return StudentState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class StudentEvent {}

class Submit extends StudentEvent {
  final StudentModel model;

  Submit(this.model);
}

class LoadStudentData extends StudentEvent {}

class Update extends StudentEvent {
  final StudentModel model;

  Update(this.model);
}

class Delete extends StudentEvent {
  final int studentId;

  Delete({required this.studentId});
}
