import 'dart:convert';

import 'package:codis_postals/models/zip_codes.dart';
import 'package:codis_postals/widgets/place_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController postCodeController = TextEditingController();
  ZipCode? zipCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Codis postals"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(80),
              child: TextField(
                controller: postCodeController,
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: fetchData,
              child: const Text("Busca!"),
            ),
            const SizedBox(height: 20),
            if (zipCode == null) const Text("Encara no hi ha dades"),
            if (zipCode != null)
              for (var place in zipCode!.places) PlaceWidget(place: place),
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    var code = postCodeController.text;

    http.Response response =
        await http.get(Uri.parse("https://api.zippopotam.us/es/$code"));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    Map<String, dynamic> jsonObject = json.decode(response.body);
    debugPrint(jsonObject["post code"]);

    zipCode = zipCodeFromJson(response.body);
    setState(() {});
  }
}
