import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/data/models/attend_model.dart';
import 'package:active_system/data/models/sub_mode.dart';
import 'package:active_system/data/service/remote/attend_data.dart';
import 'package:active_system/data/service/remote/sub_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_barcode_scanner/qrcode_barcode_scanner.dart';

abstract class HomeController extends GetxController {
  void addSession();
  void addSub();
  void addInvition();
  void addService();
  void viewAll();
  void getSub();
  void assignModel(AttendModel privetModel);
  void handlebarcode();
  void handleFunctionsAdd();
  void rightSearch();
  void searchFun();
  void deleteTransAction();
}

class HomeControllerImp extends HomeController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;
  late TextEditingController barcode;
  late TextEditingController username;
  late TextEditingController age;
  late TextEditingController subscriptions;
  late TextEditingController deadline;
  late TextEditingController phone;
  late TextEditingController note;
  late TextEditingController search;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late AttendModel attendmodel;
  int supType = 0;
  bool isactive = false;
  List<AttendModel> attendList = [];
  List<List<String>> dataInTable = [];
  final List<SubscriptionModel> _subList = [];
  List<String> subNameList = ["عام"];
  String subValue = "عام";

  @override
  void onInit() async {
    barcode = TextEditingController();
    username = TextEditingController();
    age = TextEditingController();
    subscriptions = TextEditingController();
    deadline = TextEditingController();
    phone = TextEditingController();
    note = TextEditingController();
    search = TextEditingController();
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;
    viewAll();
    getSub();

    super.onInit();
  }

  void selectSupType(int i) {
    if (i != supType) {
      supType = i;
      update();
      if (supType == 0 || supType == 1) {
        ////////////////////////////////////////////////
        handleSubType();
      }
    }
  }

  void handleSubType() {
    if (supType == 0) {
      subNameList = [];
      for (int i = 0; i < _subList.length; i++) {
        if (_subList[i].subscriptionsType == 0) {
          subNameList.add(_subList[i].subscriptionsName);
        }
      }
      subValue = subNameList[0];
    } else {
      for (int i = 0; i < _subList.length; i++) {
        if (_subList[i].subscriptionsType == 1) {
          subNameList.add(_subList[i].subscriptionsName);
        }
      }
      subValue = subNameList[0];
    }
    update();
  }

  void selectActive(bool i) {
    isactive = i;
    update();
  }

  @override
  void addInvition() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await AttendData().addInvitation({
      "barcode": barcode.text,
      "adminID": "1",
    });
    if (res["msg"] == "subscription expired") {
      globalAlert("اشتراك اللاعب منتهي");
      statusRequs = StatusRequst.failure;
      print("no");
    } else if (res["status"] == "success") {
      print("fukk");
      attendmodel = AttendModel.fromJson(res["data"]);
      for (int i = 0; i < subNameList.length; i++) {
        if (attendmodel.subscriptionsName == subNameList[i]) {
          subValue = subNameList[i];
        }
      }
      statusRequs = StatusRequst.sucsess;
    } else if (res["msg"] == "invitition expired") {
      globalAlert("الاعب تخطى عدد الدعوات");
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void addService() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await AttendData().addInvitation({
      "barcode": barcode.text,
      "adminID": "1",
    });
    if (res["msg"] == "subscription expired") {
      globalAlert("اشتراك اللاعب منتهي");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      print("fukk");
      attendmodel = AttendModel.fromJson(res["data"]);
      for (int i = 0; i < subNameList.length; i++) {
        if (attendmodel.subscriptionsName == subNameList[i]) {
          subValue = subNameList[i];
        }
      }
      statusRequs = StatusRequst.sucsess;
    } else if (res["msg"] == "service expired") {
      globalAlert("الاعب تخطى عدد الخدمات");
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void addSession() async {
    statusRequs = StatusRequst.loading;
    update();
    String price = "0";
    for (int i = 0; i < subNameList.length; i++) {
      if (subValue == _subList[i].subscriptionsName) {
        price = _subList[i].subscriptionsPrice.toString();
      }
    }
    Map? res;
    if (barcode.text.isEmpty) {
      if (formKey.currentState!.validate()) {
        res = await AttendData().addSessions({
          "barcode": barcode.text,
          "phone": phone.text,
          "name": username.text,
          "price": price,
          "adminID": "1",
        });
        if (res!["status"] == "failure") {
          globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
          statusRequs = StatusRequst.failure;
        } else if (res["status"] == "success") {
          globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "yessssss");
          statusRequs = StatusRequst.sucsess;
        }
      }
    } else {
      res = await AttendData().addSessions({
        "barcode": barcode.text,
        "phone": phone.text,
        "name": username.text,
        "adminID": "1",
      });
      if (res!["status"] == "failure") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "yessssss");
        statusRequs = StatusRequst.sucsess;
      }
    }
    update();
  }

  @override
  void addSub() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await AttendData().addSub({
      "barcode": barcode.text,
      "adminID": "1",
    });
    if (res["msg"] == "renew") {
      globalAlert("هناك مشكلة في تجديد اللاعب");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      attendmodel = AttendModel.fromJson(res["data"]);
      for (int i = 0; i < subNameList.length; i++) {
        if (attendmodel.subscriptionsName == subNameList[i]) {
          subValue = subNameList[i];
        }
      }

      statusRequs = StatusRequst.sucsess;
    } else if (res["msg"] == "subscription expired") {
      globalAlert("اشتراك اللاعب منتهي");
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void assignModel(AttendModel privetModel) {
    username.text = privetModel.usersName!;
    phone.text = privetModel.usersPhone!;
    barcode.text = privetModel.barcode.toString();
    deadline.text = privetModel.renewalEnd.toString().substring(0, 11);
    note.text = privetModel.usersNote!;
    subValue = privetModel.subscriptionsName!;
    attendmodel = privetModel;
  }

  @override
  void getSub() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await SubData().view();
    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      subNameList = [];
      _subList.addAll(data.map((e) => SubscriptionModel.fromJson(e)));
      for (int i = 0; i < _subList.length; i++) {
        if (_subList[i].subscriptionsType == 0) {
          subNameList.add(_subList[i].subscriptionsName);
        }
      }
      subValue = subNameList[0];

      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void viewAll() async {
    statusRequs = StatusRequst.loading;
    update();

    var res = await AttendData().dailyView({
      "day": DateTime.now().toString().substring(0, 11),
    });
    if (res["status"] == "failure") {
      print("object");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      attendList = [];
      attendList.addAll(data.map((e) => AttendModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    await Future.delayed(const Duration(milliseconds: 300));
    update();
  }

  @override
  void handlebarcode() {
    // double? mid = double.tryParse(barcode.text);
    // if (mid == null) {
    //   barcode.text = "";
    // }

    QrcodeBarcodeScanner(
      onScannedCallback: (String value) {
        barcode.text = value;
      },
    );
  }

  @override
  void handleFunctionsAdd() {
    if (supType == 0) {
    } else if (supType == 1) {
      addSession();
    } else if (supType == 2) {
    } else {}
  }

  @override
  void rightSearch() async {
    statusRequs = StatusRequst.loading;
    String? search;
    update();
    if (barcode.text.isNotEmpty ||
        (username.text.isEmpty && barcode.text.isNotEmpty)) {
      search = barcode.text;
    } else if (username.text.isEmpty && barcode.text.isEmpty) {
    } else {
      search = username.text;
    }
    var res = await AttendData().usersSearch({
      "search": search,
    });
    if (res["status"] == "success") {
      print("fukk");
      attendmodel = AttendModel.fromJson(res["data"]);
      print(attendmodel.attendanceBarcodeId);
      for (int i = 0; i < subNameList.length; i++) {
        if (attendmodel.subscriptionsName == subNameList[i]) {
          subValue = subNameList[i];
        }
      }

      username.text = attendmodel.usersName!;
      phone.text = attendmodel.usersPhone!;
      barcode.text = attendmodel.barcode.toString();
      deadline.text = attendmodel.renewalEnd.toString().substring(0, 11);
      note.text = attendmodel.usersNote!;
      subValue = attendmodel.subscriptionsName!;
      statusRequs = StatusRequst.sucsess;
    } else if (res["status"] == "failure") {
      print("noooo");
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void searchFun() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await AttendData().search({"search": search.text});
    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      attendList = [];
      attendList.addAll(data.map((e) => AttendModel.fromJson(e)));
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
        attendList[i].attendanceStart.toString(),
        attendList[i].attendanceEnd.toString(),
        attendList[i].usersName.toString(),
        attendList[i].subscriptionsName.toString(),
        attendList[i].isOwed.toString(),
        attendList[i].isClose.toString(),
      ]);
    }
  }

  @override
  void deleteTransAction() async {
    var res = await AttendData().delete({
      "id": attendmodel.attendanceId.toString(),
      "renewid": attendmodel.attendanceRenewalid.toString(),
    });

    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      attendList.removeWhere(
          (element) => element.attendanceId == attendmodel.attendanceId);
      statusRequs = StatusRequst.sucsess;
    } else if (res["msg"] == "expire") {
      globalAlert("لايمكن حذف هذا اللاعب", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    }
    update();
  }
}
