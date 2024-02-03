import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class AdminData{
AdminData() ;

  view()async{
    var res =await Api().post(uri: linkAdminView, body: {});
    return res;
  }

   add(Map data)async{
    var res =await Api().post(uri: linkAdminAdd, body: data,
    );
    return res;
  }
   edit(Map data )async{
     var res =await Api().post(uri: linkAdminEdit, body: data);
    return res;
    
  }
   delete(Map data)async{
    var res =await Api().post(uri: linkAdminDelete, body: data);
    return res;
  }
}