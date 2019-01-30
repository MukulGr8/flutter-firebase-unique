import 'package:flutter/material.dart';


class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: new Text("Dashboard"),
              bottom: TabBar(
                  tabs: [
                    new Container(
                      padding: EdgeInsets.all(25.0),
                      child:new Text("IPD",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      height: 50.0,
                    ),

                    new Container(
                      padding: EdgeInsets.all(25.0),
                      height: 50.0,
                      child:new Text("OPD",style: TextStyle(fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
                    )
                  ]
              ),
            ),

            body: TabBarView(

              children: [
                new Container(
                    child:ListView(
                      children: <Widget>[
                        ListTile(
                          trailing: Icon(Icons.more_vert),
                          title: new Row(
                            children: <Widget>[
                              new Text("JYOTI KAPRI"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 110, 0)),
                              
                              new Icon(Icons.accessibility_new),
                              new Text("  33Y")
                            ],
                          ),
                          subtitle: new Row(
                            children: <Widget>[

                              new Text("IPD  A1124"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.branding_watermark),

                              new Text("   PVT-222"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.access_time),

                              new Text("   4 M")

                            ],
                          ),
                        ),
                        new Divider(),

                        ListTile(
                          trailing: Icon(Icons.more_vert),
                          title: new Row(
                            children: <Widget>[
                              new Text("POOJA SHOKINDA"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 60, 0)),

                              new Icon(Icons.accessibility_new),
                              new Text("  22Y")
                            ],
                          ),

                          subtitle: new Row(
                            children: <Widget>[

                              new Text("IPD  H1134"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.branding_watermark),

                              new Text("   PVT-121"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.access_time),

                              new Text("   9 M")
                            ],
                          ),
                        ),

                        new Divider(),

                        ListTile(
                          trailing: Icon(Icons.more_vert),
                          title: new Row(
                            children: <Widget>[
                              new Text("VAISHALI SHARMA"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 60, 0)),

                              new Icon(Icons.accessibility_new),
                              new Text("  21Y")
                            ],
                          ),
                          subtitle: new Row(
                            children: <Widget>[

                              new Text("IPD  G1156"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.branding_watermark),

                              new Text("   PVT-122"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.access_time),

                              new Text("   8 M")

                            ],
                          ),
                        ),

                      ],
                    )
                ),



                new Container(
                    child:ListView(
                      children: <Widget>[
                        ListTile(
                          trailing: Icon(Icons.more_vert),
                          title: Text('SHIVAM BHARDWAJ',style: new TextStyle(fontSize:18),),
                          subtitle: new Row(
                            children: <Widget>[

                              new Text("OPD  D1124"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.branding_watermark),

                              new Text("   PVT-227"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.access_time),

                              new Text("   7 M")

                            ],
                          ),
                        ),
                        new Divider(),

                        ListTile(
                          trailing: Icon(Icons.more_vert),
                          title: Text('HIMANSHU CHHIKARA',style: new TextStyle(fontSize:18),),
                          subtitle: new Row(
                            children: <Widget>[

                              new Text("OPD  C1124"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.branding_watermark),

                              new Text("   PVT-522"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.access_time),

                              new Text("   6 M")

                            ],
                          ),
                        ),

                        new Divider(),

                        ListTile(
                          trailing: Icon(Icons.more_vert),
                          title: Text('GOURAV BANSAL',style: new TextStyle(fontSize:18),),
                          subtitle: new Row(
                            children: <Widget>[

                              new Text("OPD  B1124"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.branding_watermark),

                              new Text("   PVT-242"),
                              new Padding(padding:EdgeInsets.fromLTRB(0, 0, 20, 0)),

                              new Icon(Icons.access_time),

                              new Text("   5 M")

                            ],
                          ),
                        ),

                      ],
                    )
                ),
              ],
            ),

          )
      ),
    );
  }
}
