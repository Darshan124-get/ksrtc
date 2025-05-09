import 'package:flutter/material.dart';

class BusDetailPage extends StatelessWidget {
  const BusDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> subStops = [
      'Koramangala',
      'Forum Mall',
      'Ejipura',
      'Indiranagar',
      'Domlur',
      'M.G Road',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bus: Alexander Lynn",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("Start: Koramangala"),
            const Text("End: M.G Road"),
            const SizedBox(height: 20),
            const Text(
              "Sub Stops:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: subStops.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(subStops[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
