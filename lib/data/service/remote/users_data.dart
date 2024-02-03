import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class UsersData{
 UsersData();

   add(Map data)async{
    var res =await Api().post(uri: linkUsersAdd, body: data,
    );
    return res;
  }
   edit(Map data )async{
     var res =await Api().post(uri: linkUsersEdit, body: data);
    return res;
    
  }
   delete(Map data)async{
    var res =await Api().post(uri: linkUsersDelete, body: data);
    return res;
  }
   search(Map data)async{
    var res =await Api().post(uri: linkUsersDelete, body: data);
    return res;
  }
}