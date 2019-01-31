import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import './Board.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


class Admiss extends StatefulWidget {
  @override
  _AdmissState createState() => _AdmissState();
}

class _AdmissState extends State<Admiss> {

  //making a list of our board class objects
  List<Board> boardMessages = List();
  Board board;

  //Creating a instance to the firebase
  final FirebaseDatabase database = FirebaseDatabase.instance;
  int noIndex;
  DatabaseReference databaseReference;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //override init state method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //This is important line
    board = Board("", "","","","");
    //creating a child named community board in the realtime database
    databaseReference = database.reference().child("Community_board");
    databaseReference.onChildAdded.listen(_onEntryAdded);
    databaseReference.onChildChanged.listen(_onEntryChanged);
    print("database total values are " + noIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admission"),
      ),
      body: new Column(
        //this will create a form for user to submit it have many advantages over creating textfields
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Form(
              key: formKey,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.perm_identity),
                    title: TextFormField(
                      initialValue: "",
                      onSaved: (val) => board.name = val,
                      validator: (val) => val.trim() == "" ? val : null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.view_agenda),
                    title: TextFormField(
                      initialValue: "",
                      onSaved: (val) => board.age = val,
                      validator: (val) => val.trim() == "" ? val : null,
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.fiber_manual_record),
                    title: TextFormField(
                      initialValue: "",
                      onSaved: (val) => board.iono = val,
                      validator: (val) => val.trim() == "" ? val : null,
                    ),
                  ),


                  ListTile(
                    leading: Icon(Icons.branding_watermark),
                    title: TextFormField(
                      initialValue: "",
                      onSaved: (val) => board.bed = val,
                      validator: (val) => val.trim() == "" ? val : null,
                    ),
                  ),


                  ListTile(
                    leading: Icon(Icons.timelapse),
                    title: TextFormField(
                      initialValue: "",
                      onSaved: (val) => board.nmonth = val,
                      validator: (val) => val.trim() == "" ? val : null,
                    ),
                  ),
                  
                  FlatButton(
                    child: new Text("Submit"),textColor: Colors.white,
                    color: Colors.redAccent,
                    onPressed: () {
                      handleSubmit();
                    },
                  )
                ],
              ),
            ),
          ),
//          Flexible(
//            child: FirebaseAnimatedList(
//                query: databaseReference,
//                itemBuilder: (_, DataSnapshot snapshot,
//                    Animation<double> animation, int index) {
////                  index = index-1;
////                  int newIndex = index ~/2;
//                  print(index);
//                  return new Card(
//                    child: ListTile(
//                      leading: new CircleAvatar(
//                        backgroundColor: Colors.red,
//                      ),
//                      title: Text(boardMessages[index].subject),
//                      subtitle: Text(boardMessages[index].body),
//                      onTap: () => deleteMe(index),
//                    ),
//                  );
//                }),
//          )
        ],
      ),
    );
  }

  void _onEntryAdded(Event event) {
    setState(() {
      boardMessages.add(Board.fromSnapshot(event.snapshot));
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      //form save will called when a field is saved using onSave in the form
      form.save();
      form.reset();
      //save from data to the database
      databaseReference.push().set(board.toJson());
      Navigator.pop(context,boardMessages);
    }
  }


  void _onEntryChanged(Event event) {
    var oldEntry = boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      boardMessages[boardMessages.indexOf(oldEntry)] =
          Board.fromSnapshot(event.snapshot);
    });
  }


}


//  void _incrementCounter() {
//    setState(() {
//      //send data to the firebase in the form of a map
//      database.reference().child("message").set({
//        "Firstname" : "Vishal"
//      });
//      //Retrive data from the firebase in the form of a map
//      database.reference().child("message").once().then((DataSnapshot snapshot){
//        Map<dynamic,dynamic> data = snapshot.value;
//
//        //Print all the values of the map objects in our database
//        print("Values of the objects are ${data.values} ");
//      });
//
//      _counter++;
//    });
//  }
