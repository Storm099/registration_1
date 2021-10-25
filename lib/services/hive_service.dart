
import 'package:hive/hive.dart';
import 'package:registration_1/model/user_model.dart';

class HiveDb{

  var mybox = Hive.box("my_demo");

  void storeData(User user){
    mybox.add(user.toJson());
  }
  List<User> loaddata(){
    List<User> list = [];
    for(var i = 0; i < mybox.length;i++){
      list.add(User.fromJson(mybox.getAt(i)));
    }
    return list;
  }



}