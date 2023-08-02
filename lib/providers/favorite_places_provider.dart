import 'package:course_6th_project/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesNotifier extends StateNotifier<List<Place>> {
  FavoritePlacesNotifier() : super([]);

  bool toggleStatus(Place place) {
    final placeIsFavorite = state.contains(place);

    if (placeIsFavorite) {
      state = state.where((m) => m.id != place.id).toList();
      return false;
    } else {
      state = [...state, place];
      return true;
    }
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<Place>>((ref) {
  return FavoritePlacesNotifier();
});
