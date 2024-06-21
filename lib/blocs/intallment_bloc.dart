import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/InstallModel.dart';
import 'package:school_app/repositories/install_repository.dart';

class InstallmentBloc extends Bloc<InstallmentEvent, InstallmentState> {
  final InstallmentRepository repository;

  InstallmentBloc({required this.repository}) : super(InstallmentState()) {
    on<Submit>(_onSubmit);
    on<LoadInstallmentData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadInstallmentData event, Emitter<InstallmentState> emit) async {
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


  Future<void> _onSubmit(Submit event, Emitter<InstallmentState> emit) async {
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

class InstallmentState {
  final StateTypes currentState;
  final String? error;
  final List<InstallModel> items;

  InstallmentState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const [],
  });

  InstallmentState copyWith({
    StateTypes? currentState,
    String? error,
    List<InstallModel>? items,
  }) {
    return InstallmentState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

abstract class InstallmentEvent {}

class Submit extends InstallmentEvent {
  final InstallModel model;

  Submit(this.model);
}

class LoadInstallmentData extends InstallmentEvent {}

