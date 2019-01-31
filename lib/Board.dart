import 'package:firebase_database/firebase_database.dart';

class Board{
  String key;
  String name;
  String age;
  String iono;
  String bed;
  String nmonth;


  Board(this.name, this.age, this.iono,
      this.bed, this.nmonth);

  Board.fromSnapshot(DataSnapshot snapshot):
        key = snapshot.key,
        name = snapshot.value["name"],
        age = snapshot.value["age"],
        iono = snapshot.value["iono"],
        bed = snapshot.value["bed"],
        nmonth = snapshot.value["nmonth"];

  toJson(){
    return {
      "name":name,
      "age":age,
      "iono":iono,
      "bed":bed,
      "nmonth":nmonth,
    };
  }


}