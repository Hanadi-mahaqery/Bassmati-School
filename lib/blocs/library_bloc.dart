import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/LibraryModel.dart';
import 'package:school_app/repositories/student_repository.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState>{
  final StudentRepository repository;

  StudentBloc({required this.repository}) : super(StudentState()){
    on<Submit>(_onSubmit);
    on<LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadData event, Emitter<StudentState> emit)async{
    emit(state.copyWith(currentState: StateTypes.loading));
    try{
      var items = await repository.getAll();
      emit(state.copyWith(
          currentState: StateTypes.loaded,
          items: items,
          error: null
      ));
    }
    catch(ex){
      emit(
          state.copyWith(
              currentState: StateTypes.error,
              error: "Error: ${ex}"
          )
      );
    }
  }
  Future<void> _onSubmit(Submit event, Emitter<StudentState> emit)async{
    emit(state.copyWith(currentState: StateTypes.submitting));
    try{
      var res = await repository.add(event.model);
      if(res){
        emit(state.copyWith(
            currentState: StateTypes.submitted,
            error: null
        ));
      }
      else{
        emit(state.copyWith(
            currentState: StateTypes.error,
            error: "Error: Adding Field"
        ));
      }
    }
    catch(ex){
      emit(
          state.copyWith(
              currentState: StateTypes.error,
              error: "Exp: ${ex}"
          )
      );
    }
  }

}


class StudentState {
  final StateTypes currentState;
  final String? error;
  final List<LibraryModel> items;

  StudentState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  StudentState copyWith({
    StateTypes? currentState,
    String? error,
    List<LibraryModel>? items
  }) {
    return StudentState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class StudentEvent {}

class Submit extends StudentEvent {
  final LibraryModel model;

  Submit(this.model);
}

class LoadData extends StudentEvent {}