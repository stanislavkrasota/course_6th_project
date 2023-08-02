import 'dart:io';

import 'package:course_6th_project/models/place.dart';
import 'package:course_6th_project/providers/place_provider.dart';
import 'package:course_6th_project/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});
  // final void Function(Place) addNewPlaceItem;

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _saveChanges() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.trim().isEmpty || _selectedImage == null) {
      return;
    } else {
      ref
          .watch(userPlacesProvider.notifier)
          .addplace(Place(title: enteredTitle, image: _selectedImage!));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              maxLength: 50,
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (value) {},
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 20),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton.icon(
                  onPressed: _saveChanges,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
