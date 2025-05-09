import 'package:flutter/material.dart';

class SearchBusPage extends StatelessWidget {
  const SearchBusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController sourceController = TextEditingController();
    final TextEditingController destinationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Bus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: sourceController,
              decoration: const InputDecoration(
                labelText: 'Source',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: destinationController,
              decoration: const InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // back to map for now
                // Later you can show matching buses here
              },
              child: const Text('Search Bus'),
            )
          ],
        ),
      ),
    );
  }
}
