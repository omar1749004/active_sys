import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';
import 'package:camera/camera.dart';

class UsersData{
 UsersData();

   add(Map data,{XFile ? file})async{
    late dynamic res  ;
    if(file == null){
     res = await Api().post(uri: linkUsersAdd, body: data);
    }else{
       res =await Api().postFile(uri: linkUsersAdd, body: data,file: file
    );
    }
    return res;
  }
   edit(Map data ,{XFile? file})async{
    late dynamic res  ;
    if(file == null){
     res = await Api().post(uri: linkUsersEdit, body: data);
    return res;
    }else{
     res  =await Api().postFile(uri: linkUsersEdit, body: data, file: file);
      return res;
    }
  }

   delete(Map data)async{
    var res =await Api().post(uri: linkUsersDelete, body: data);
    return res;
  }
   search(Map data)async{
    var res =await Api().post(uri: linkUsersSearch, body: data);
    return res;
  }
}