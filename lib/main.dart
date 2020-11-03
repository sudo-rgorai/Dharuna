import 'package:flutter/material.dart';
import 'package:Dharuna/drive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dharuna',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dharuna'),
      routes: {
        '/drive': (context) => Drive(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(size: 42.0),
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Text('A'),
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          child: Text('B'),
        )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text('To page 1'),
          // onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          title: const Text('To page 2'),
          // onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          title: const Text('other drawer item'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xFFebedee),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100, right: 20),
                child: new Image.asset(
                  'ikshana.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100, left: 20),
                child: new Image.asset(
                  'app_logo.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ]),
            Expanded(
              child: Container(
                height: 100.0,
                width: 100.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/drive');
                    },
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Text("Start")],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: new Image.asset(
                  'drive.gif',
                  width: 600.0,
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: drawerItems,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
