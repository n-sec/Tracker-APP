import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalizationScreen extends StatefulWidget {
  final LatLng target;

  LocalizationScreen({Key key, this.target}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocalizationScreen(this.target);

}

class _LocalizationScreen extends State {

  LatLng _center;

  _LocalizationScreen(this._center);

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  
  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {
      _markers.add(
        Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId("1"),
          position: _center,
          infoWindow: InfoWindow(
            title: 'Really cool place',
            snippet: '5 Star Rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Localizar'),
      ),
      body: GoogleMap(
        markers: _markers,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12,
        ),
      ),
      bottomNavigationBar: ButtonTheme.bar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Bloquear'),
                ),
                PopupMenuItem(
                  child: Text('Desbloquear'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.center_focus_strong),
        label: Text('Centralizar'),
        onPressed: () {},
      ),
    );
  }

}