import 'package:codis_postals/models/zip_codes.dart';
import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.placeName, style: const TextStyle(fontSize: 30)),
                  Text(place.state, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(width: 20),
            const Icon(Icons.place, size: 30),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(place.longitude, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
                Text(place.latitude, style: const TextStyle(fontSize: 18)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
