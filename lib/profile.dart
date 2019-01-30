import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: new Text("Profile"),
              bottom: TabBar(
                isScrollable: true,
                  tabs: [
                    new Container(
                      padding: EdgeInsets.all(25.0),
                      child:new Text("Details",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      height: 50.0,
                    ),

                    new Container(
                      padding: EdgeInsets.all(25.0),
                      height: 50.0,
                      child:new Text("Allergies",style: TextStyle(fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
                    ),

                    new Container(
                      padding: EdgeInsets.all(25.0),
                      height: 50.0,
                      child:new Text("Medical Condition",style: TextStyle(fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
                    ),

                  ]
              ),
            ),

            body: TabBarView(

              children: [
                new Container(
                    child:GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      children: <Widget>[
                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.contact_mail),
                            title: new Text("Patient ID"),
                            subtitle: new Text("P28674"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.add_circle),
                            title: new Text("Admit ID"),
                            subtitle: new Text("A23474"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.location_on),
                            title: new Text("Ward"),
                            subtitle: new Text("Private"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.broken_image),
                            title: new Text("Bed"),
                            subtitle: new Text("116"),
                          ),
                        ),

                        new Center(
                          child:new Text("Details",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                        ),


                      ],
                    )
                ),



                new Container(
                    child:GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      children: <Widget>[
                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.contact_mail),
                            title: new Text("Patient ID"),
                            subtitle: new Text("P28674"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.add_circle),
                            title: new Text("Admit ID"),
                            subtitle: new Text("A23474"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.location_on),
                            title: new Text("Ward"),
                            subtitle: new Text("Private"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.broken_image),
                            title: new Text("Bed"),
                            subtitle: new Text("116"),
                          ),
                        ),

                        new Center(
                          child:new Text("Allergies",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                        ),

                      ],
                    )
                ),

                new Container(
                    child:GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      children: <Widget>[
                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.contact_mail),
                            title: new Text("Patient ID"),
                            subtitle: new Text("P28674"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.add_circle),
                            title: new Text("Admit ID"),
                            subtitle: new Text("A23474"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.location_on),
                            title: new Text("Ward"),
                            subtitle: new Text("Private"),
                          ),
                        ),

                        GridTile(
                          child: ListTile(
                            leading: Icon(Icons.broken_image),
                            title: new Text("Bed"),
                            subtitle: new Text("116"),
                          ),
                        ),

                        new Center(
                          child:new Text("Medical Conditions",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
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
