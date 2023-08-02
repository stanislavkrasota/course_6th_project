import 'package:course_6th_project/models/place.dart';
import 'package:course_6th_project/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PLacesList extends StatelessWidget {
  const PLacesList({super.key, required this.places});

  final List<Place> places;

  void _openPlaceDetails(BuildContext context, Place place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PlaceDetailScreen(
          place: place,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
          child: Text(
        'No places added yet',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ));
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (BuildContext ctx, int index) => Dismissible(
        key: ValueKey(places[index].id),
        child: SizedBox(
          width: double.infinity,
          child: ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(
              places[index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () => _openPlaceDetails(context, places[index]),
          ),
        ),
        onDismissed: (direction) {},
      ),
    );
  }
}
