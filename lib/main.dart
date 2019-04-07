import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scheduler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    );
    var _scaffoldkey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.sort, color: Colors.blue),
          onPressed: () {
            _scaffoldkey.currentState.openDrawer();
          },
        ),
        title: Text(
          "Classify",
          style: new TextStyle(
              color: Colors.blueGrey, fontFamily: 'Pacifico', fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: SlidingUpPanel(
          backdropEnabled: true,
          panel: _floatingPanel(),
          borderRadius: radius,
          body: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Text(
                'Today',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountEmail: Text(
              'nur.amuni26@gmail.com',
              style: TextStyle(color: Colors.black),
            ),
            accountName: Text(
              'Eimen Nur',
              style: TextStyle(
                  color: Colors.black, fontSize: 20.0, fontFamily: 'Pacifico'),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.brown,
                child: Icon(
                  Icons.person,
                  ),
              ),
              CircleAvatar(
                backgroundColor: Colors.indigo,
              )
            ],
            currentAccountPicture: CircleAvatar(
              
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 30.0),
            ),
          ),
          ListTile(
            title: Text('Drawer'),
          )
        ],
      ),
    );
  }
}

Widget _floatingPanel() {
  return Container(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            'Schedule',
            style: TextStyle(
                color: Colors.blueAccent,
                fontFamily: 'Montserrat',
                fontSize: 22.0),
          ),
        ),
      ],
    ),
  );
}
