import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/data/models/attend_model.dart';
import 'package:active_system/data/service/remote/attend_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class AttendController extends GetxController {
  // void viewAll();
  // void dateSearch(DateTime startD, DateTime endD);
  // void handlTable(bool isdate);
}
class AttendControllerImp extends AttendController{
   StatusRequst statusRequs = StatusRequst.non;

   late TextEditingController searchVal;
   bool isSearch = false;
   bool isdateSearch = true;
   DateTime startSearch = DateTime.now();
   DateTime endSearch = DateTime.now();
   int totalPlayer = 0 ;
   List<AttendModel> attendList = [] ; 
   @override
  void onInit() {
    searchVal =TextEditingController();
    dateSearch(startSearch,endSearch) ;
    super.onInit();
  }
  
    @override
  void dateSearch(DateTime startD, DateTime endD) async {
    statusRequs = StatusRequst.loading;
    print("object");
    update();
    if (isdateSearch) {
      var res = await AttendData().dateSearch({
        "start_date": startD.toString(),
        "end_date": endD.toString(),
      });
      if (res["status"] == "failure") {
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        List data = res["data"];
        // totalPlayer = res["moreInfo"][0]["totalPlayers"] ?? 0 ;
        // print(totalPlayer);
        attendList = [] ;
        attendList.addAll(data.map((e) => AttendModel.fromJson(e)));
        
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    }
    update();
  }
    // @override
  // void viewAll() async{
  //   statusRequs = StatusRequst.loading;
  //    update();
  //    var res = await RenewData().view();
  //     if (res["status"] == "failure") {
  //       statusRequs = StatusRequst.failure;
  //     } else if (res["status"] == "success") {
  //       List data = res["data"];
  //       renewList = [] ;
  //       renewList.addAll(data.map((e) => RenewModel.fromJson(e)));
  //       statusRequs = StatusRequst.sucsess;
  //     } else {
  //       statusRequs = StatusRequst.failure;
  //     }
  //     update();
  // }

  // void checkSearch(String val)
  // {
  //   if(val.isEmpty)
  //   {
  //     statusRequs = StatusRequst.non;
  //     isSearch =false;

  //   }
  //   else{
  //     isSearch =true;
  //     _search();
  //   }
  //   update();
  // }
   
  //   void _search() async{
  //    statusRequs = StatusRequst.loading;
  //    update();
  //    var res = await RenewData().search(
  //     {
  //       "search": searchVal.text
  //     }
  //    );
  //     if (res["status"] == "failure") {
  //       statusRequs = StatusRequst.failure;
  //     } else if (res["status"] == "success") {
  //       List data = res["data"];
  //       renewList = [] ;
  //       renewList.addAll(data.map((e) => RenewModel.fromJson(e)));
  //       statusRequs = StatusRequst.sucsess;
  //     } else {
  //       statusRequs = StatusRequst.failure;
  //     }
  //     update();
  // }
  //    @override
  //   void handlTable(bool isdate) {
  //   isdateSearch =  isdate ;
    
  //   if(isdateSearch){
  //    dateSearch(startSearch ,endSearch) ;
  //   }else{
  //     viewAll();
  //   }
    
  // }
  

}