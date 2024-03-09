import 'package:active_system/core/class/handle_data_in_table.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/data/models/attend_model.dart';
import 'package:active_system/data/models/sub_mode.dart';
import 'package:active_system/data/service/remote/attend_data.dart';
import 'package:active_system/data/service/remote/sub_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void addSession();
  void addSub();
  void addInvition();
  void addService();
  void viewAll();
  void getSub();
  void assignModel(AttendModel privetModel);
  void calcAge();
  void handlebarcode();
  void handleFunctionsAdd();
  void rightSearch();
  void searchFun();
  void deleteTransAction();
  void clearModel();
  void changemodel(String subName);
  void selectRow(int assignSelect);
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
  int selcetRenew = 0;
  String? imageName;
  DateTime? brithDay;
  bool canDelete = false;
  bool isactive = false;
  int selectedIndex = -1;
  List<AttendModel> attendList = [];
  late SubscriptionModel subscriptionModel;
  List<List<String>> dataInTable = [];
  final List<SubscriptionModel> _subList = [];
  List<String> subNameList = ["عام"];
  String subValue = "عام";
  MyServices myServices = Get.find();
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
    barcode.text = "0";
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 300));
    firstState = StatusRequst.failure;
   viewAll();
   getSub();
   
    super.onInit();
  }

  void selectSupType(int i) {
    if (i != supType) {
      supType = i;
      ////////////////////////////////////////////////
      handleSubType();
      update();
    }
  }

  void handleSubType() {
    if (supType != 1) {
      subNameList = [];
      for (int i = 0; i < _subList.length; i++) {
        if (_subList[i].subscriptionsType == 0) {
          subNameList.add(_subList[i].subscriptionsName);
        }
      }
      subValue = subNameList[0];
    } else {
      subNameList = [];
      for (int i = 0; i < _subList.length; i++) {
        if (_subList[i].subscriptionsType == 1) {
          subNameList.add(_subList[i].subscriptionsName);
        }
      }
      subValue = subNameList[0];
    }

    changemodel(subValue);
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
      "adminID": myServices.sharedPreferences.getString("id"),
    });
    if (res["msg"] == "barcode not found") {
      globalAlert("الباركود ليس مستخدم يرجى ادخال الباركود الصحيح",
          title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      attendmodel = AttendModel.fromJson(res["data"]);
      assignModel(attendmodel);
      attendList.add(attendmodel);
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
      update();
      await Future.delayed(const Duration(seconds: 2));
      clearModel();
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
    if (barcode.text.isNotEmpty) {
      var res = await AttendData().addService({
        "barcode": barcode.text,
        "adminID": myServices.sharedPreferences.getString("id"),
      });
      if (res["msg"] == "barcode not found") {
        globalAlert("الباركود ليس مستخدم يرجى ادخال الباركود الصحيح",
            title: "!خطأ");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        attendmodel = AttendModel.fromJson(res["data"]);
        assignModel(attendmodel);
        attendList.add(attendmodel);
        assignDataInsideTable();
        statusRequs = StatusRequst.sucsess;
        update();
        await Future.delayed(const Duration(seconds: 2));
        clearModel();
      } else if (res["msg"] == "service expired") {
        globalAlert("الاعب تخطى عدد الخدمات");
        statusRequs = StatusRequst.failure;
      } else {
        statusRequs = StatusRequst.failure;
      }
    } else {
      globalAlert("يجب ادخال الباركود");
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void addSession() async {
    statusRequs = StatusRequst.loading;
    update();
    bool go = false;
    if (barcode.text == "0" && (username.text.isEmpty || phone.text.isEmpty)) {
      go = false;
      formKey.currentState!.validate();
    } else {
      go = true;
    }
    if (go) {
      var res = await AttendData().addSessions({
        "phone": phone.text,
        "name": username.text,
        "barcode": barcode.text,
        "subsriptionId": subscriptionModel.subscriptionsId.toString(),
        "price": subscriptionModel.subscriptionsPrice.toString(),
        "adminId": myServices.sharedPreferences.getString("id"),
      });

      if (res["msg"] == "barcode not found") {
        globalAlert("الباركود ليس مستخدم يرجى ادخال الباركود الصحيح",
            title: "!خطأ");

        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        attendmodel = AttendModel.fromJson(res["data"]);
        assignModel(attendmodel);
        attendList.add(attendmodel);
        assignDataInsideTable();
        statusRequs = StatusRequst.sucsess;
        update();
        await Future.delayed(const Duration(seconds: 2));
        clearModel();
      } else if (res!["status"] == "failure") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      }
    } else {
      statusRequs = StatusRequst.failure;
      update();
    }
    update();
  }

  @override
  void addSub() async {
    statusRequs = StatusRequst.loading;
    update();
    if (barcode.text != "0") {
      var res = await AttendData().addSub({
        "barcode": barcode.text,
        "adminID": myServices.sharedPreferences.getString("id"),
        "renewa_id": selcetRenew.toString()
      });
      selcetRenew = 0;
      if (res["msg"] == "renew") {
        globalAlert("هناك مشكلة في تجديد اللاعب");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        attendmodel = AttendModel.fromJson(res["data"]);
        assignModel(attendmodel);
        attendList.add(attendmodel);
        assignDataInsideTable();
        statusRequs = StatusRequst.sucsess;
        update();
        await Future.delayed(const Duration(seconds: 2));
        clearModel();
      } else if (res["status"] == "expired") {
        globalAlert("اشتراك اللاعب منتهي");
        attendmodel = AttendModel.fromJson(res["data"]);
        assignModel(attendmodel);
        statusRequs = StatusRequst.sucsess;
        update();
        await Future.delayed(const Duration(seconds: 2));
        clearModel();
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "many") {
        statusRequs = StatusRequst.sucsess;
        update();
        selecRenew(res["data"]);
      } else if (res["msg"] == "barcode not found") {
        globalAlert("الباركود ليس مستخدم يرجى ادخال الباركود الصحيح",
            title: "!خطأ");
            statusRequs = StatusRequst.failure;
      } else {
        statusRequs = StatusRequst.failure;
      }
    } else {
      globalAlert("يجب ادخال الباركود");
      statusRequs = StatusRequst.failure;
    }

    update();
  }

  void selecRenew(List<dynamic> subscriptions) {
    List<Widget> buttons = [];

    for (int i = 0; i < subscriptions.length; i++) {
      buttons.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              selcetRenew = subscriptions[i]["renewal_id"];
              Get.back();
              addSub();
            },
            child: Text(subscriptions[i]["subscriptions_name"]),
          ),
        ),
      );
    }

    Get.defaultDialog(
      title: "",
      middleText: "يرجى اختيار اشتراك اللاعب",
      actions: [
        Column(
          children: buttons,
        ),
      ],
    );
  }

  @override
  void assignModel(AttendModel privetModel) {
    attendmodel = privetModel;
    username.text = privetModel.usersName!;
    phone.text = privetModel.usersPhone!;
    imageName = privetModel.usersImage;
    barcode.text = privetModel.barcode?.toString() ?? "0";
    deadline.text = privetModel.renewalEnd?.toString().substring(0, 11) ?? '';
    if (privetModel.brithDay != null) {
      brithDay = privetModel.brithDay;
      calcAge();
    }

    note.text = privetModel.usersNote ?? "";

    if (privetModel.subscriptionsName != null && supType != 1) {
      subValue = privetModel.subscriptionsName!;
    }
    subscriptions.text = privetModel.subscriptionsName!;
    update();
  }

  @override
  void calcAge() {
    int midage = DateTime.now().year - brithDay!.year;
    age.text = midage.toString();
  }

  @override
  void clearModel() {
    username.clear();
    phone.clear();
    barcode.text = "0";
    deadline.clear();
    brithDay = null;
    age.clear();
    subscriptions.clear();
    imageName = null;
    note.clear();
    selectedIndex = -1;
    update();
  }

  @override
  void changemodel(String subName) {
    for (int i = 0; i < _subList.length; i++) {
      if (_subList[i].subscriptionsName == subName) {
        subscriptionModel = _subList[i];
        break;
      }
    }
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
      subscriptionModel = _subList[0];
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
      attendList = [];
      assignDataInsideTable();
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
    double? mid = double.tryParse(barcode.text);
    if (mid == null) {
      barcode.text = "0";
    }
  }

  @override
  void handleFunctionsAdd() {
    if (supType == 0) {
      addSub();
    } else if (supType == 1) {
      addSession();
    } else if (supType == 2) {
      addInvition();
    } else {
      addService();
    }
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
      attendmodel = AttendModel.fromJson(res["data"]);
      assignModel(attendmodel);
      statusRequs = StatusRequst.sucsess;
      update();
      await Future.delayed(const Duration(seconds: 3));
      clearModel();
      statusRequs = StatusRequst.sucsess;
    } else if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void searchFun() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await AttendData().search({
      "search": search.text,
      "start_date": DateTime.now().toString().substring(0, 11),
      "end_date": DateTime.now().toString().substring(0, 11),
    });
    if (res["status"] == "failure") {
      attendList = [];
      assignDataInsideTable();
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
    selectedIndex = -1;
    for (var i = 0; i < attendList.length; i++) {
      dataInTable.add([
        attendList[i].attendanceId.toString(),
        attendList[i].barcode.toString(),
        attendList[i].usersName.toString(),
        attendList[i].subscriptionsName.toString(),
        handleDataInTable()
            .handelAttendanceTypeData(attendList[i].attendanceType),
        attendList[i].attendanceStart.toString(),
        attendList[i].attendanceEnd.toString(),
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
      "safeId": attendmodel.safeId == 0 ? "" : attendmodel.safeId.toString(),
      "adminID": myServices.sharedPreferences.getString("id"),
    });

    if (res["msg"] == "expire") {
      globalAlert("لايمكن حذف هذا اللاعب", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      attendList.removeWhere(
          (element) => element.attendanceId == attendmodel.attendanceId);
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  void handlSelcetRow() async {
    canDelete = true;
    update();
    //to wait 7 sec then set globalViarable.home=0
    await Future.delayed(const Duration(milliseconds: 7000));
    canDelete = false;
    update() ;
  }

  @override
  void selectRow(int assignSelect) {
    if (selectedIndex == assignSelect) {
      selectedIndex = -1; // Reset if tapped again
      canDelete = false;
    } else {
      canDelete = true;
      selectedIndex = assignSelect;
    }
    update();
  }
}
