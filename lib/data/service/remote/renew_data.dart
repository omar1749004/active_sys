import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class RenewData{
 RenewData();

   view()async{
    var res =await Api().get(url: linkRenewView);
    return res;
  }

   add(Map data)async{
    var res =await Api().post(uri: linkRenewAdd, body: data,
    );
    return res;
  }
   edit(Map data )async{
     var res =await Api().post(uri: linkRenewEdit, body: data);
    return res;
    
  }
   delete(Map data)async{
    var res =await Api().post(uri: linkRenewDelete, body: data);
    return res;
  }
   search(Map data)async{
    var res =await Api().post(uri: linkRenewSearch, body: data);
    return res;
  }
  dateSearch(Map data)async{
    var res =await Api().post(uri: linkRenewDateSearch, body: data);
    return res;
  }

  usersSearch(Map data)async{
    var res =await Api().post(uri: linkRenewUsersSearch, body: data);
    return res;
  }
}