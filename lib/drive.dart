import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'dart:math';
import 'dart:async';

class Drive extends StatefulWidget {
  @override
  _DriveState createState() => _DriveState();
}

class _DriveState extends State<Drive> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
          title: new Text("Message"),
          content: new Text("Your location is now being tracked."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    });
  }

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
          // alignment: AlignmentDirectional.bottomCenter,
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
            Align(
              alignment: FractionalOffset.topCenter,
              child: Container(
                width: 4000,
                //color: Colors.grey[100],
                child: Flexible(
                  child: FittedBox(
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.cyan[100],
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Closest Vehicle',
                                  ),
                                  new Roller(),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.grey[700],
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Road status',
                                  ),
                                  Text(
                                    'Crowded',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 35),
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text(
                      'Stop Tracking',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}

class Roller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TheRandom();
  }
}

class _TheRandom extends State<Roller> {
  double _number = 1;
  generateRandomNumber() {
    final _random = new Random();
    int next() => _random.nextInt(2);
    if (mounted)
      setState(() {
        if (next() == 0 && _number + 0.1 < 10)
          _number += 0.1;
        else if (_number - 0.1 > 0.5) _number -= 0.1;
      });
  }

  @override
  Widget build(BuildContext context) {
    const oneSec = const Duration(seconds: 2);
    new Timer.periodic(oneSec, (Timer t) => generateRandomNumber());
    return Column(
      children: [
        Text(
          double.parse('$_number').toStringAsFixed(2) + ' m',
        ),
      ],
    );
  }
}
