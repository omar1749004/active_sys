import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class ExpensesData{
  ExpensesData();
    view()async{
    var res =await Api().post(uri: linkExpensesView, body: {});
    return res;
  }

   add(Map data)async{
    var res =await Api().post(uri: linkExpensesAdd, body: data,
    );
    return res;
  }
   edit(Map data)async{
     var res =await Api().post(uri: linkExpensesEdit, body: data);
    return res;
    
  }
   delete(Map data)async{
    var res =await Api().post(uri: linkExpensesDelete, body: data);
    return res;
  }
  dateSearch(Map data)async{
    var res =await Api().post(uri: linkExpensesDateSearch, body: data);
    return res;
  }
    search(Map data)async{
    var res =await Api().post(uri: linkExpensesSearch, body: data);
    return res;
  }
}