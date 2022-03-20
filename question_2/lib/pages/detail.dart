// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:question_2/models/person.dart';

class DetailPage extends StatelessWidget {
  final Person person;
  const DetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Your Friend'),
      ),
      backgroundColor: Colors.white,
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              child: getMap(person),
              height: 500,
            ),
            PersonCard(person: person)
          ],
        ),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: Image.network(
                  person.picture,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(
                  person.name.first,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget getMap(Person person) {
  String htmlId = person.id;
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final position = LatLng(
      person.location.latitude,
      person.location.longitude,
    );
    final mapOptions = MapOptions()
      ..zoom = 11
      ..draggable = false
      ..zoomControl = false
      ..panControl = false
      ..scaleControl = false
      ..fullscreenControl = false
      ..mapTypeControl = false
      ..streetViewControl = false
      ..center = position;

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..position = position
      ..map = map
      ..title = 'Hello World!');

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}
