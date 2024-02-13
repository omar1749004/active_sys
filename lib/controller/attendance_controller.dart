import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/data/models/attend_model.dart';
import 'package:active_system/data/service/remote/attend_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class AttendController extends GetxController {
  // void viewAll();
  void dateSearch(DateTime startD, DateTime endD);
  // void handlTable(bool isdate);
}

class AttendControllerImp extends AttendController {
  StatusRequst statusRequs = StatusRequst.non;

  late TextEditingController searchVal;
  bool isSearch = false;
  bool isdateSearch = true;
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();
  int totalPlayer = 0;
  List<AttendModel> attendList = [];
  List<List<String>> dataInTable = [];
  @override
  void onInit() {
    searchVal = TextEditingController();
    dateSearch(startSearch, endSearch);

    super.onInit();
  }

  @override
  void dateSearch(DateTime startD, DateTime endD) async {
    statusRequs = StatusRequst.loading;

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
        totalPlayer = res["moreInfo"][0]["totalPlayers"] ?? 0;
        attendList = [];
        attendList.addAll(data.map((e) => AttendModel.fromJson(e)));
        assignDataInsideTable();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    }
    update();
  }

  void checkSearch(String val) {
    if (val.isEmpty) {
      statusRequs = StatusRequst.non;
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
    });
    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      totalPlayer = res["moreInfo"][0]["totalPlayers"] ?? 0;

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
        attendList[i].attendanceBarcodeId.toString(),
        attendList[i].attendanceId.toString(),
        attendList[i].subscriptionsName.toString(),
        attendList[i].usersName.toString(),
        attendList[i].usersPhone.toString(),
        attendList[i].attendanceType.toString(),
        attendList[i].barcode.toString(),
      ]);
    }
  }
  //  @override
  // void handlTable(bool isdate) {
  // isdateSearch =  isdate ;

  // if(isdateSearch){
  //  dateSearch(startSearch ,endSearch) ;
  // }else{
  //   viewAll();
  // }

  // }
}
