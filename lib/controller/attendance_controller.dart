import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/data/models/attend_model.dart';
import 'package:active_system/data/service/remote/attend_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class AttendController extends GetxController {
  void viewAll();
  void dateSearch(DateTime startD, DateTime endD);
  void handlTable(bool isdate);
}

class AttendControllerImp extends AttendController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;

  late TextEditingController searchVal;
  bool isSearch = false;
  bool isdateSearch = true;
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();
  String? s ;
  String? e;
  int totalPlayer = 0;
  List<AttendModel> attendList = [];
  List<List<String>> dataInTable = [];
  
  @override
  void onInit() async {
    searchVal = TextEditingController();
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;

    dateSearch(startSearch, endSearch);

    super.onInit();
  }

  @override
  void dateSearch(DateTime startD, DateTime endD) async {
    statusRequs = StatusRequst.loading;
   s = startD.toString().substring(0,11) ;
    e = endD.toString().substring(0,11) ;
    update();
      var res = await AttendData().dateSearch({
        "start_date": startD.toString().substring(0,11),
        "end_date":endD.toString().substring(0,11),
      });
      if (res["status"] == "failure") {
        attendList = [];
        assignDataInsideTable();
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        List data = res["data"];
        totalPlayer = res["moreInfo"][0]["totalPlayers"] ?? 0;
        attendList = [];
        attendList.addAll(data.map((e) => AttendModel.fromJson(e)));
        assignDataInsideTable();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    await Future.delayed(const Duration(milliseconds: 200));
    
    update();
  }

  void checkSearch(String val) {
    if (val.isEmpty) {
      statusRequs = StatusRequst.non;
      handlTable(isdateSearch) ;
      isSearch = false;
    } else {
      isSearch = true;
      _search();
    }
    update();
  }

  void _search() async {
    statusRequs = StatusRequst.loading;
    update();

    var res = await AttendData().search({
      "search": searchVal.text,
      "start_date":s,
      "end_date":e,
      });
    if (res["status"] == "failure") {
      attendList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      attendList = [];
      attendList.addAll(data.map((e) => AttendModel.fromJson(e)));

      //assign data inside table
      assignDataInsideTable();

      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

//function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < attendList.length; i++) {
      dataInTable.add([
        attendList[i].attendanceId.toString(),
        " ${attendList[i].attendanceDay!.year}/${attendList[i].attendanceDay!.month}/${attendList[i].attendanceDay!.day}",
        attendList[i].usersName.toString(),
        attendList[i].attendanceStart.toString(),
        attendList[i].attendanceEnd.toString(),
        attendList[i].usersPhone.toString(),
        attendList[i].usersNote.toString(),
        attendList[i].attendanceRenewalid.toString(),
      ]);
    }
  }
   @override
  void handlTable(bool isdate) {
  isdateSearch =  isdate ;

  if(isdateSearch){

   dateSearch(startSearch ,endSearch) ;
  }else{
    s = "" ;
    e = "" ;
    viewAll();
  }

  }

  @override
  void viewAll() async {
     statusRequs = StatusRequst.loading;
    update();
      var res = await AttendData().viwe();
      if (res["status"] == "failure") {
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        List data = res["data"];
        totalPlayer = res["moreInfo"][0]["totalPlayers"] ?? 0;
        attendList = [];
        attendList.addAll(data.map((e) => AttendModel.fromJson(e)));
         assignDataInsideTable();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
   await Future.delayed(const Duration(milliseconds: 200));
    
    update();
  }

}
