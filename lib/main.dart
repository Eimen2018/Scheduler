import 'package:flutter/material.dart';
import 'package:scheduler/CustomShapeClipper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:intl/intl.dart';

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
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss').format(now);
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    );
    var _scaffoldkey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldkey,
      drawer: AppDrawer(),
      endDrawer: AppEndDrawer(),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            onPressed: () {
              _scaffoldkey.currentState.openEndDrawer();
            },
          )
        ],
      ),
      body: SlidingUpPanel(
        minHeight: 65.0,
        collapsed: _collapsed(),
        backdropEnabled: true,
        panel: _floatingPanel(),
        borderRadius: radius,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 400.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(161, 196, 253, 1),
                        Color.fromRGBO(194, 233, 251, 1)
                      ],
                    )),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Next Class in',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Oxygen',
                                  fontSize: 22.0,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28.0, vertical: 25.0),
                          child: Container(
                            height: 70.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Center(
                              child: Text(formattedDate,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontSize: 42.0)),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.center,
                                  colors: [
                                    Color.fromRGBO(12, 52, 131, 1),
                                    Color.fromRGBO(162, 182, 223, 1),
                                    Color.fromRGBO(107, 140, 206, 1),
                                    Color.fromRGBO(162, 182, 223, 1),
                                  ]),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            'Knowledge Managment System',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Oxygen',
                                fontSize: 22.0),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30.0),
                                          bottomRight: Radius.circular(30.0))),
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {},
                                      ),
                                      Text('Add Task',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Oxygen',
                                              fontSize: 18.0)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0),
                                      child: IconButton(
                                        icon: Icon(Icons.more_vert),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text(
                    'Tasks Coming Up...',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Oxygen',
                        fontSize: 20.0),
                  ),
                ),
              ],
            ),
            Container(
              height: 170.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: tasks,
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Tasks> tasks = [
  Tasks("images/exams.png", "Data mining and Ware...", "2 days"),
  Tasks("images/studying.png", "Expert System", "3 days"),
  Tasks("images/task.png", "Advanced Internet Progra...", "1 week"),
  Tasks("images/teaching.png", "Network and System Adminstration",
      "1 week and 2 days")
];

class Tasks extends StatelessWidget {
  final String taskimage, taskname, tasktime;

  Tasks(this.taskimage, this.taskname, this.tasktime);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 120.0,
            width: 150.0,
            child: Image.asset(
              taskimage,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              // color: Colors.black,
              // border: Border.all(width: 0.0),
              // borderRadius: BorderRadius.all(
              //   Radius.circular(20.0),
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            width: 150.0,
            height: 40.0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color.fromRGBO(161, 196, 253, 1), Colors.white12.withOpacity(0.1)],
              )),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(taskname, style: TextStyle(fontFamily: 'Oxygen',fontWeight: FontWeight.bold)),
                    Text(tasktime, style: TextStyle(fontFamily: 'Oxygen'))
                  ],
                )
              ],
            ),
          )
        ],
      ),
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
class AppEndDrawer extends StatefulWidget {
  @override
  _AppEndDrawerState createState() => _AppEndDrawerState();
}

class _AppEndDrawerState extends State<AppEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('E-Commerce',style: TextStyle(
                color: Colors.black, fontFamily: 'Oxygen', fontSize: 22.0),),
            subtitle: Text('Requested A make up on thursday'),
          ),
          ListTile(
            title: Text('Knowledge Management System',style: TextStyle(
                color: Colors.black, fontFamily: 'Oxygen', fontSize: 22.0),),
            subtitle: Text('Released test 1 Results'),
          )
        ],
      ),
    );
  }
}

Widget _collapsed() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Color.fromRGBO(161, 196, 253, 1),
        Color.fromRGBO(194, 233, 251, 1)
      ]),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'Schedule',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Montserrat', fontSize: 22.0),
        ),
      ],
    ),
  );
}

Widget _floatingPanel() {
  return Container(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text(
            'Schedule',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Montserrat', fontSize: 22.0),
          ),
        ),
      ],
    ),
  );
}
