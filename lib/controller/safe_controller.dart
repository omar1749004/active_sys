import 'package:active_system/core/class/handle_data_in_table.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/data/models/safe_model.dart';
import 'package:active_system/data/service/remote/safe_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SafeController extends GetxController {
  void dateSearch(DateTime startD, DateTime endD);
  void viewAll();
  void handlTable(bool isdate);
  void changeSfarType(int type);
  void validatenum(String mid);
  String changeReson();
  String changeDate();
  void addTrandsAction();
}

class SafeControllerImp extends SafeController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();
  bool isdateSearch = true;
  double toralSafe = 0;
  double toralIncoming = 0;
  double toralOutcoming = 0;
  int typeOfSafe = 3;
  MyServices myServices =Get.find();
  List<SafeModel> safeList = [];
  List<List<String>> dataInTable = [];
  late TextEditingController reason;
  late TextEditingController amount;
  late TextEditingController adminName;
  double incoming = 0;
  double outgoing = 0;

  @override
  void onInit() async {
    reason = TextEditingController();
    amount = TextEditingController();
    adminName = TextEditingController();
    //adminName.text = myServices.sharedPreferences.getString("name")!;
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;
    dateSearch(startSearch, endSearch);
    statusRequs = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 300));
    statusRequs = StatusRequst.failure;
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
    await Future.delayed(const Duration(milliseconds: 200));
    
    update();
  }

  @override
  void viewAll() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await SafeData().view();
    if (res["status"] == "failure") {
      safeList = [];
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      toralIncoming = double.parse(res["moreInfo"]["totalincoming"]);
      toralOutcoming = double.parse(res["moreInfo"]["totalOutgioing"]);
      toralSafe = toralIncoming - toralOutcoming;
      safeList = [];
      safeList.addAll(data.map((e) => SafeModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    await Future.delayed(const Duration(milliseconds: 200));
    update();
  }

  @override
  void handlTable(bool isdate) {
    
     update();
    if (isdateSearch) {
     dateSearch(startSearch, endSearch);
    } else {
      viewAll();
    }
    
  }

  @override
  void changeSfarType(int type) {
    if (typeOfSafe != type) {
      typeOfSafe = type;
      incoming = 0;
      outgoing = 0;
      changeDate();
      changeReson();
      update();
    }
  }

  @override
  String changeDate() {
    return typeOfSafe == 3 ? "تاريخ السحب" : "تاريخ الايداع";
  }

  @override
  String changeReson() {
    return typeOfSafe == 3 ? "سبب السحب" : "سبب الايداع";
  }

  @override
  void validatenum(String mid) {
    try {
      if (typeOfSafe == 3) {
        outgoing = double.parse(mid);
      } else {
        incoming = double.parse(mid);
      }
    } catch (e) {
      amount.text = "";
      update();
    }
  }

  @override
  void addTrandsAction() async {
    if (formKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();
      var res = await SafeData().add(
        {
          "reason": reason.text,
          "incoming": incoming.toString(),
          "outgoing": outgoing.toString(),
          "adminId": myServices.sharedPreferences.getString("id"),
          "type": typeOfSafe.toString(),
        },
      );
      if (res["status"] == "failure") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        reason.clear();
        amount.clear();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    }
    update();
  }

  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < safeList.length; i++) {
      dataInTable.add([
        safeList[i].safeId.toString(),
        safeList[i].safeDesc.toString(),
        "${safeList[i].safeDate!.hour}:${safeList[i].safeDate!.minute}      ${safeList[i].safeDate!.year}/${safeList[i].safeDate!.month}/${safeList[i].safeDate!.day}",
        safeList[i].safeIncoming.toString(),
        safeList[i].safeOutgoing.toString(),
        safeList[i].remaining.toString(),
        handleDataInTable().handleSafeType(safeList[i].safeType),
        safeList[i].adminSysName.toString(),
      ]);
    }
  }
}
