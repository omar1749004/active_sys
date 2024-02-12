
import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class SafeData{
  SafeData();

    view()async{
    var res =await Api().post(uri: linkSafeView, body: {});
    return res;
  }
  getpdf(Map data)async{
    var res =await Api().post(uri: linkpdfSafe, body: data);
    return res;
  }

   add(Map data)async{
    var res =await Api().post(uri: linkSafeAdd, body: data,
    );
    return res;
  }
   dateSearch(Map data )async{
     var res =await Api().post(uri: linkSafeDateSearch, body: data);
    return res;
  }
  search(Map data )async{
     var res =await Api().post(uri: linkSafeSearch, body: data);
    return res;
  }

}