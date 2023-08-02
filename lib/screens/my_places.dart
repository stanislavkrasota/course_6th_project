import 'package:course_6th_project/providers/place_provider.dart';
import 'package:course_6th_project/screens/new_place.dart';
import 'package:course_6th_project/widgets/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  // final List<Place> _placeList = dummyPlaces;

  void _setScreen(BuildContext context) async {
    // Navigator.of(context).pop();
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewPlaceScreen(),
      ),
    );
    if (newItem == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availablePlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () => _setScreen(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PLacesList(places: availablePlaces),
      ),
    );
  }
}
