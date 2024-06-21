import 'package:bloc/bloc.dart';
import 'package:school_app/data_enum/state_types.dart';
import 'package:school_app/models/PdfModel.dart';
import 'package:school_app/repositories/pdf_repository.dart';

class PdfBloc extends Bloc<PdfEvent, PdfState> {
  final PdfRepository repository;

  PdfBloc({required this.repository}) : super(PdfState()) {
    on<FetchPdfItemsBySubjectId>(_onFetchPdfItemsBySubjectId);
  }

  Future<void> _onFetchPdfItemsBySubjectId(FetchPdfItemsBySubjectId event, Emitter<PdfState> emit) async {
    emit(state.copyWith(currentState: StateTypes.loading));
    try {
      var items = await repository.getBySubject(event.subjectId);
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

class PdfState {
  final StateTypes currentState;
  final String? error;
  final List<StuProfModel> items;

  PdfState({
    this.currentState = StateTypes.init,
    this.error,
    this.items = const []
  });

  PdfState copyWith({
    StateTypes? currentState,
    String? error,
    List<StuProfModel>? items
  }) {
    return PdfState(
        currentState: currentState ?? this.currentState,
        error: error ?? this.error,
        items: items ?? this.items
    );
  }
}

abstract class PdfEvent {}

class FetchPdfItemsBySubjectId extends PdfEvent {
  final int subjectId;

  FetchPdfItemsBySubjectId({required this.subjectId});
}
