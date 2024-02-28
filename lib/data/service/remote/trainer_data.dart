import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class TrainerData{
 TrainerData();

   view()async{
    var res =await Api().post(uri: linkTrainerView,body: {});
    return res;
  }

   add(Map data)async{
    var res =await Api().post(uri: linkTrainerAdd, body: data,
    );
    return res;
  }
   edit(Map data )async{
     var res =await Api().post(uri: linkTrainerEdit, body: data);
    return res;
    
  }
   delete(Map data)async{
    var res =await Api().post(uri: linkTrainerDelete, body: data);
    return res;
  }
   search(Map data)async{
    var res =await Api().post(uri: linkTrainerSearch, body: data);
    return res;
  }
}