import 'package:flutter/material.dart';

class NewPlace extends StatelessWidget {
  const NewPlace({super.key});

  final String placeName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Place'),
      ),
      body: const Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(label: Text('Name')),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: null,
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('Add Place'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
