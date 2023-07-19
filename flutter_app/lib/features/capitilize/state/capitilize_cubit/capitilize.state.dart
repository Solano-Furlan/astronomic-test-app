import 'package:flutter_app/features/capitilize/domain/capitilized.interface.dart';

abstract class CapitilizeState {}

class CapitilizeInitialState extends CapitilizeState {}

class CapitilizeLoadingState extends CapitilizeState {}

class CapitilizeLoadedState extends CapitilizeState {
  CapitilizeLoadedState({
    required this.capitilized,
  });

  final ICapitilized capitilized;
}

class CapitilizeErrorState extends CapitilizeState {}
