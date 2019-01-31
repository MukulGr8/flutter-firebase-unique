import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uneva_flutter/Board.dart';

class Profile extends StatefulWidget {

  List<Board> boardMessages;

  Profile({Key key, @required this.boardMessages}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Board board;

  //Creating a instance to the firebase
  final FirebaseDatabase database = FirebaseDatabase.instance;
  int noIndex;
  DatabaseReference databaseReference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    board = Board("", "","","","");
    //creating a child named community board in the realtime database
    databaseReference = database.reference().child("Community_board");
    //it will continuosly listen if a new data is added in the firebase database
    databaseReference.onChildChanged.listen(_onEntryChanged);

    print("database total values are " + noIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: new Text("Profile"),
              bottom: TabBar(isScrollable: true, tabs: [
                new Container(
                  padding: EdgeInsets.all(25.0),
                  child: new Text(
                    "Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  height: 50.0,
                ),
                new Container(
                  padding: EdgeInsets.all(25.0),
                  height: 50.0,
                  child: new Text(
                    "Allergies",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(25.0),
                  height: 50.0,
                  child: new Text(
                    "Medical Condition",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                new Container(
                  child: FirebaseAnimatedList(
                      query: databaseReference,
                      itemBuilder: (_, DataSnapshot snapshot,
                          Animation<double> animation, int index) {
//                  index = index-1;
//                  int newIndex = index ~/2;
                        print(index);
                        return new Card(
                          child: ListTile(
                            title: new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                new Text(widget.boardMessages[index].name),
                                new Padding(padding: EdgeInsets.fromLTRB(0, 0, 130, 0)),
                                new Icon(Icons.person_add),
                                new Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0)),
                                new Text(widget.boardMessages[index].age),
                              ],
                            ),
                            subtitle: new Row(
                              children: <Widget>[
                                new Text("IPD   "+widget.boardMessages[index].iono),
                                new Padding(padding: EdgeInsets.fromLTRB(0, 0, 30, 0)),
                                new Icon(Icons.broken_image),
                                new Text("PVT   "+widget.boardMessages[index].bed),
                                new Padding(padding: EdgeInsets.fromLTRB(0, 0, 30, 0)),
                                new Icon(Icons.access_time),
                                new Text("  "+widget.boardMessages[index].nmonth),
                              ],
                            ),
                            onTap: () => deleteMe(index),
                          ),
                        );
                      }),
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
          )),
    );
  }

  void _onEntryChanged(Event event) {
    var oldEntry = widget.boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      widget.boardMessages[widget.boardMessages.indexOf(oldEntry)] =
          Board.fromSnapshot(event.snapshot);
    });
  }



  void deleteMe(int index) {
    setState(() {
      widget.boardMessages.removeAt(index);
      databaseReference.child(widget.boardMessages[index].key).remove();
      widget.boardMessages.clear();
      print(index.toString() + "this is new index");
    });
  }
}
