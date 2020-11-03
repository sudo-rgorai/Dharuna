import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;

class Drive extends StatefulWidget {
  @override
  _DriveState createState() => _DriveState();
}

class _DriveState extends State<Drive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Your Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            new FlutterMap(
              options: new MapOptions(
                center: new latLng.LatLng(22.315, 87.31),
                zoom: 15.0,
              ),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'])
              ],
            ),
            RaisedButton(
                color: Colors.cyan,
                child: Text('Stop Tracking'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ]),
    );
  }
}
