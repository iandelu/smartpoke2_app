import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/service/unit_of_measure_service.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class UnitOfMeasureState {
  final List<UnitOfMeasure> units;
  final bool isLoading;
  final String? error;

  UnitOfMeasureState({
    required this.units,
    required this.isLoading,
    this.error,
  });

  UnitOfMeasureState copyWith({
    List<UnitOfMeasure>? units,
    bool? isLoading,
    String? error,
  }) {
    return UnitOfMeasureState(
      units: units ?? this.units,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class UnitOfMeasureNotifier extends StateNotifier<UnitOfMeasureState> {
  final UnitOfMeasureService _service;

  UnitOfMeasureNotifier(this._service)
      : super(UnitOfMeasureState(units: [], isLoading: false)) {
    _fetchUnitsOfMeasure();
  }

  Future<void> _fetchUnitsOfMeasure() async {
    state = state.copyWith(isLoading: true);

    try {
      final units = await _service.fetchUnitsOfMeasure();
      state = state.copyWith(units: units, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final unitOfMeasureProvider =
StateNotifierProvider<UnitOfMeasureNotifier, UnitOfMeasureState>(
        (ref) => UnitOfMeasureNotifier(UnitOfMeasureService()));
