import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'profile.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

String appTitle = 'Uneva';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Hospital App',style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.blueAccent),)),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: Text('UNEVA',style: new TextStyle(fontWeight: FontWeight.w900,fontSize: 85.0),),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),

            ListTile(
              title: Text('Dashboard'),
              leading: Icon(Icons.dashboard),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                timeDilation=2.0;
                Navigator.pop(context);
                //appTitle = "DashBoard";
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new DashBoard()));
              },
            ),


            ListTile(
              title: Text('Admissions'),
              leading: Icon(Icons.line_weight),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Discharged'),
              leading: Icon(Icons.access_time),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('OPDs'),
              leading: Icon(Icons.local_hospital),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Messages'),
              leading: Icon(Icons.message),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            new Divider(),

            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person_pin),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                timeDilation=2.0;
                Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Profile()));
              },
            ),

            ListTile(
              title: Text('Support'),
              leading: Icon(Icons.help),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              subtitle: Center(
                child:Text('2018 Uneva'),) ,
            ),

          ],
        ),
      ),
    );
  }
}