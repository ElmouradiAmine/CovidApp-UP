import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:unicorndial/unicorndial.dart';

import '../config/palette.dart';
import '../widgets/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Circle> _circles = HashSet<Circle>();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    enableLocationServices();
  }

  void _setCircles(int i) {
    switch (i) {
      case 0:
        _circles.add(
          Circle(
              circleId: CircleId("0"),
              center: LatLng(34.030738, -6.798914),
              radius: 50.0,
              strokeColor: Colors.transparent,
              fillColor: Colors.green.withOpacity(0.3)),
        );
        _circles.add(
          Circle(
              circleId: CircleId("1"),
              center: LatLng(34.029336, -6.801017),
              radius: 60.0,
              strokeColor: Colors.transparent,
              fillColor: Colors.green.withOpacity(0.3)),
        );
        break;
      case 1:
        _circles.add(
          Circle(
              circleId: CircleId("3"),
              center: LatLng(34.032991, -6.800454),
              radius: 80.0,
              strokeColor: Colors.transparent,
              fillColor: Colors.orange.withOpacity(0.3)),
        );

        _circles.add(
          Circle(
              circleId: CircleId("4"),
              center: LatLng(34.031465, -6.802542),
              radius: 100.0,
              strokeColor: Colors.transparent,
              fillColor: Colors.orange.withOpacity(0.3)),
        );
        break;
      case 2:
        _circles.add(
          Circle(
              circleId: CircleId("5"),
              center: LatLng(34.033864, -6.798855),
              radius: 20.0,
              strokeColor: Colors.transparent,
              fillColor: Colors.red.withOpacity(0.3)),
        );
//34.031659, -6.799904
        _circles.add(
          Circle(
              circleId: CircleId("6"),
              center: LatLng(34.031659, -6.799904),
              radius: 50.0,
              strokeColor: Colors.transparent,
              fillColor: Colors.red.withOpacity(0.3)),
        );
        //34.032127, -6.801415

        _circles.add(
          Circle(
              circleId: CircleId("7"),
              center: LatLng(34.032127,  -6.801415),
              radius: 50.0,
              strokeColor: Colors.transparent,
              fillColor: Colors.red.withOpacity(0.3)),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Zone Danger",
        currentButton: FloatingActionButton(
          heroTag: "danger",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.warning),
          onPressed: () {
            _setCircles(2);
            setState(() {
              
            });
          },
        )));

    childButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Zone Risquée",
        currentButton: FloatingActionButton(
          heroTag: "risque",
          backgroundColor: Colors.orangeAccent,
          mini: true,
          onPressed: () {
            _setCircles(1);
            setState(() {
              
            });
          },
          child: Icon(
            Icons.stop,
          ),
        ),
      ),
    );

    childButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Zone Sécurisée",
        currentButton: FloatingActionButton(
          heroTag: "secure",
          backgroundColor: Colors.green,
          mini: true,
          onPressed: () {
            _setCircles(0);
            setState(() {
              
            });

          },
          child: Icon(
            Icons.thumb_up,
          ),
        ),
      ),
    );

    childButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Localisation",
        currentButton: FloatingActionButton(
          heroTag: "localisation",
          backgroundColor: Colors.blueAccent,
          mini: true,
          onPressed: () {
            enableLocationServices();
          },
          child: Icon(
            Icons.my_location,
          ),
        ),
      ),
    );
    return new Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Palette.primaryColor,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            circles: _circles,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Palette.primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Carte',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildKey('Dangereux', Colors.red),
                    _buildKey('Risqué', Colors.orange),
                    _buildKey('Sécurisé', Colors.green),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
/*
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  */

  Widget _buildKey(String title, Color color) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 10,
          backgroundColor: color,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  enableLocationServices() async {
    Geolocation.currentLocation(accuracy: LocationAccuracy.best)
        .listen((result) async {
      if (result.isSuccessful) {
        print(result.location.latitude);
        final CameraPosition _kLake = CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(result.location.latitude, result.location.longitude),
            tilt: 0,
            zoom: 17);
        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
      }
    });
  }
}
