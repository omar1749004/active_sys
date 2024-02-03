import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class SubData {
  SubData();
    view()async{
    var res =await Api().post(uri: linkSubView, body: {});
    return res;
  }

   add(Map data)async{
    var res =await Api().post(uri: linkSubAdd, body: data,
    );
    return res;
  }
   edit(Map data )async{
     var res =await Api().post(uri: linkSubEdit, body: data);
    return res;
    
  }
   delete(Map data)async{
    var res =await Api().post(uri: linkSubDelete, body: data);
    return res;
  }
  
}