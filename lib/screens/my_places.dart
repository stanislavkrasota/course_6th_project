import 'package:course_6th_project/models/place.dart';
import 'package:course_6th_project/screens/new_place.dart';
import 'package:course_6th_project/screens/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/place_provider.dart';

class MyPlaceList extends ConsumerStatefulWidget {
  const MyPlaceList({super.key});

  @override
  ConsumerState<MyPlaceList> createState() => _MyPlaceListState();
}

class _MyPlaceListState extends ConsumerState<MyPlaceList> {
  List<Place> _placeList = [];

  void _setScreen(Place? place) async {
    Navigator.of(context).pop();
    if (place == null) {
      final newItem = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const NewPlace(),
        ),
      );
      if (newItem == null) {
        return;
      }

      setState(() {
        _placeList.add(newItem);
      });
    } else {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => PlaceItem(
            place: place,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _placeList = ref.watch(placesProvider);
    Widget content = const Center(child: Text('No places added yet'));

    if (_placeList.isNotEmpty) {
      content = ListView.builder(
        itemCount: _placeList.length,
        itemBuilder: (BuildContext ctx, int index) => Dismissible(
          key: ValueKey(_placeList[index].id),
          child: Expanded(
            child: ListTile(
              onTap: () => _setScreen(_placeList[index]),
              title: Text(
                _placeList[index].title,
              ),
            ),
          ),
          onDismissed: (direction) {},
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () => _setScreen(null),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
