import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/StudentModel.dart';
import 'package:school_app/repositories/SelectSon_repository.dart';
import 'package:meta/meta.dart';
import 'package:school_app/screen/parent_login/Select_Son.dart';

class SelectsonBloc extends Bloc<SelectSonEvent, SelectSonState> {
  final SelectsonRepository repository;

  SelectsonBloc({required this.repository}) : super(SelectSonState()) {

    on<FetchStudentItemsByParentId>(_onFetchStudentItemsByParentId);

  }

  Future<void> _onFetchStudentItemsByParentId(FetchStudentItemsByParentId event, Emitter<SelectSonState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getByParentId(event.parentId);
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

}

class SelectSonState {
  final StateTypes currentState;
  final String? error;
  final List<StudentModel> items;

  SelectSonState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  SelectSonState copyWith({
    StateTypes? currentState,
    String? error,
    List<StudentModel>? items,
  }) {
    return SelectSonState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class SelectSonEvent {}

class FetchStudentItemsByParentId extends SelectSonEvent {
  final int parentId;

  FetchStudentItemsByParentId({required this.parentId});
}