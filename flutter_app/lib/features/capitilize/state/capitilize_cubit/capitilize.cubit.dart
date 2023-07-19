import 'package:flutter_app/features/capitilize/domain/capitilize.repository.interface.dart';
import 'package:flutter_app/features/capitilize/domain/capitilized.interface.dart';
import 'package:flutter_app/features/capitilize/state/capitilize_cubit/capitilize.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CapitilizeCubit extends Cubit<CapitilizeState> {
  CapitilizeCubit({
    required this.capitilizeRepository,
  }) : super(CapitilizeInitialState());

  final ICapitilizeRepository capitilizeRepository;

  Future<void> getCapitilizedText({
    required String text,
  }) async {
    emit(CapitilizeLoadingState());
    try {
      final ICapitilized capitilized =
          await capitilizeRepository.getCapitilizedText(
        text: text,
      );
      emit(
        CapitilizeLoadedState(
          capitilized: capitilized,
        ),
      );
    } on Exception catch (_) {
      emit(
        CapitilizeErrorState(),
      );
    }
  }
}
