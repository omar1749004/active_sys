import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/data/models/safe_model.dart';
import 'package:active_system/data/service/remote/safe_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class TreasuryRegisterController extends GetxController {
  void dateSearch(DateTime startD, DateTime endD);
  void search(DateTime startD, DateTime endD, String desc);
  void makeSearch();
}

class TreasuryRegisterControllerImp extends TreasuryRegisterController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();

  late TextEditingController reason;
  List<SafeModel> safeList = [];
  List<List<String>> dataInTable = [];
  bool checkedValue = false;

  double toralSafe = 0;
  double toralIncoming = 0;
  double toralOutcoming = 0;

  @override
  void onInit()async {
    reason = TextEditingController();
   firstState = StatusRequst.loading;
    await  Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;
   dateSearch(startSearch,endSearch);
    super.onInit();
  }

  @override
  void dateSearch(DateTime startD, DateTime endD) async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await SafeData().dateSearch({
      "start_date": startD.toString().substring(0, 11),
      "end_date": endD.toString().substring(0, 11),
    });

    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
      toralIncoming = 0;
      toralOutcoming = 0;
      toralSafe = 0;
      safeList = [];
      assignDataInsideTable();
    } else if (res["status"] == "success") {
      List data = res["data"];
      toralIncoming = double.parse(res["moreInfo"][0]["totalincoming"]);
      toralOutcoming = double.parse(res["moreInfo"][0]["totalOutgioing"]);
      toralSafe = toralIncoming - toralOutcoming;
      safeList = [];
      safeList.addAll(data.map((e) => SafeModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    await  Future.delayed(const Duration(milliseconds: 300));
    update();
  }

  @override
  void search(DateTime startD, DateTime endD, String desc) async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await SafeData().search({
      "search": desc,
      "start_date": startD.toString().substring(0, 11),
      "end_date": endD.toString().substring(0, 11),
    });

    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
      toralIncoming = 0;
      toralOutcoming = 0;
      toralSafe = 0;
      safeList = [];
      assignDataInsideTable();
    } else if (res["status"] == "success") {
      
      List data = res["data"];
      toralIncoming = double.parse(res["moreInfo"][0]["totalincoming"]);
      toralOutcoming = double.parse(res["moreInfo"][0]["totalOutgioing"]);
      toralSafe = toralIncoming - toralOutcoming;
      safeList = [];
      safeList.addAll(data.map((e) => SafeModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  void cnangeCheack(bool val) {
    checkedValue = !checkedValue;
    ;
    update();
  }

  @override
  void makeSearch() {
    if (reason.text.isEmpty) {
      dateSearch(startSearch, endSearch);
    } else {
      search(startSearch, endSearch, reason.text);
    }
  }

  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < safeList.length; i++) {
      dataInTable.add([
        safeList[i].remaining.toString(),
        safeList[i].safeDate.toString(),
        safeList[i].safeId.toString(),
        safeList[i].safeOutgoing.toString(),
        safeList[i].safeIncoming.toString(),
        safeList[i].totalIncoming.toString(),
      ]);
    }
  }
}
