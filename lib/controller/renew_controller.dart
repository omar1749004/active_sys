import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/data/models/renew_model.dart';
import 'package:active_system/data/models/sub_mode.dart';
import 'package:active_system/data/models/user_model.dart';
import 'package:active_system/data/service/remote/renew_data.dart';
import 'package:active_system/data/service/remote/sub_data.dart';
import 'package:active_system/data/service/remote/trainer_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RenewController extends GetxController {
  void getSub();
  void getTrainer();
  void changemodel(String subName);
  void calAfterDesc(String offer);
  void calPayed(String payed);
  void setEndDate(DateTime start);
  void barcodeSearch();
  void addRenew();
  void viewAll();
  void gotoFrezze(RenewModel privteModel);
  void dateSearch(DateTime startD, DateTime endD);
  void handlTable(bool isdate);
  void deleteRenew();
  void editPRenew();
  void assignModel(RenewModel privetModel);
}

class RenewControllerImp extends RenewController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController barcodeNum;
  late TextEditingController userName;
  late TextEditingController note;
  late TextEditingController phone;
  late TextEditingController preNote;

  late TextEditingController searchVal;

  late TextEditingController sessionNum;
  late TextEditingController dayNum;
  late TextEditingController price;
  late TextEditingController descound;
  late TextEditingController afterDescound;
  late TextEditingController amount;
  late TextEditingController notknow;
  late TextEditingController remining;

  final List<SubscriptionModel> _subList = [];
  List<String> subNameList = ["عام"];
  final List<UserModel> _trainerList = [];
  List<String> trainerNameList = ["عام"];
  late SubscriptionModel subscriptionModel;
  late RenewModel renewUser;
  //search
  List<RenewModel> renewList = [];

  List<List<String>> dataInTable = [];

  bool isSearch = false;
  bool isdateSearch = true;
  bool canAdd = true;
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();

  String trainerValue = "عام";
  String subValue = "عام";
  String payedType = "0";
  MyServices myServices = Get.find();
  late String _amountMid;
  DateTime? start = DateTime.now();
  DateTime? end = DateTime.now();
  @override
  void onInit() async {
    barcodeNum = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    preNote = TextEditingController();
    sessionNum = TextEditingController();
    dayNum = TextEditingController();
    price = TextEditingController();
    descound = TextEditingController();
    afterDescound = TextEditingController();
    amount = TextEditingController();
    notknow = TextEditingController();
    remining = TextEditingController();
    note = TextEditingController();
    searchVal = TextEditingController();
    preNote.text = "";
    descound.text = "0";
    amount.text = "0";
    remining.text = "0";
    notknow.text = "0";
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;
    getSub();
    getTrainer();
    handlTable(isdateSearch);
    statusRequs = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 300));
    statusRequs = StatusRequst.failure;
    update();

    super.onInit();
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
      subNameList.addAll(_subList.map((e) => e.subscriptionsName));
      subValue = subNameList[0];
      subscriptionModel = _subList[0];

      sessionNum.text =
          subscriptionModel.subscriptionsSessionsNumber.toString();
      dayNum.text = subscriptionModel.subscriptionsDay.toString();
      price.text = subscriptionModel.subscriptionsPrice.toString();
      afterDescound.text = price.text;
      _amountMid = price.text;
      amount.text = price.text;
      setEndDate(start!);
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void getTrainer() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await TrainerData().view();

    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      trainerNameList = [];
      _trainerList.addAll(data.map((e) => UserModel.fromJson(e)));
      trainerNameList.addAll(_trainerList.map((e) => e.usersName!));
      trainerValue = trainerNameList[0];
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void changemodel(String subName) {
    for (int i = 0; i < subNameList.length; i++) {
      if (_subList[i].subscriptionsName == subName) {
        subscriptionModel = _subList[i];
        sessionNum.text =
            subscriptionModel.subscriptionsSessionsNumber.toString();
        dayNum.text = subscriptionModel.subscriptionsDay.toString();
        price.text = subscriptionModel.subscriptionsPrice.toString();
        amount.text = price.text;
        _amountMid = price.text;
        descound.text = "0";
        afterDescound.text = price.text;
      }
    }
  }

  @override
  void calAfterDesc(String offer) {
    try {
      double mid = double.parse(price.text) - double.parse(offer);
      afterDescound.text = mid.toString();
      amount.text = afterDescound.text;
      _amountMid = amount.text;
    } catch (e) {
      descound.text = "0";
      amount.text = price.text;
      afterDescound.text = price.text;
      remining.text = "0";
    }
  }

  @override
  void calPayed(String payed) {
    try {
      double mid = double.parse(_amountMid) -
          (double.parse(payed) + double.parse(descound.text));
      remining.text = mid.toString();
    } catch (e) {
      descound.text = "0";
      amount.text = price.text;
      afterDescound.text = price.text;
    }
  }

  @override
  void setEndDate(DateTime start) {
    end = start.add(Duration(days: subscriptionModel.subscriptionsDay));
    update();
  }

  @override
  void barcodeSearch() async {
    if (int.tryParse(barcodeNum.text) != null) {
      statusRequs = StatusRequst.loading;
      update();
      var res = await RenewData().usersSearch({
        "search": barcodeNum.text,
      });
      if (res["status"] == "failure") {
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        renewUser = RenewModel.fromJson(res["data"]);
        assignModel(renewUser);
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    } else {
      statusRequs = StatusRequst.failure;
    }

    update();
  }

  @override
  void addRenew() async {
    statusRequs = StatusRequst.loading;
    update();

    if (formKey.currentState!.validate()) {
      var res = await RenewData().add({
        "userid": renewUser.usersId.toString(),
        "name": renewUser.usersName,
        "captinId": renewUser.usersCaptiantid.toString(),
        "barcodeId": renewUser.barcodeId.toString(),
        "subscriptionsId": subscriptionModel.subscriptionsId.toString(),
        "note": note.text,
        "start": start.toString(),
        "end": start.toString(),
        "offer": descound.text,
        "payed_type": payedType,
        "amount": amount.text,
        "amount_owed": remining.text,
        "renewal_adminId": myServices.sharedPreferences.getString("id"),
      });
      if (res["status"] == "failure") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        handlTable(isdateSearch);
        barcodeNum.clear();
        userName.clear();
        phone.clear();
        note.clear();
        remining.text = "0";
        descound.text = "0";
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  void setTypePaed(String typeofPayed) {
    if ("نقدى" == typeofPayed) {
      amount.text = price.text;
      descound.text = "0";
      payedType = "0";
    } else if ("محفظة" == typeofPayed) {
      descound.text = price.text;
      calAfterDesc(descound.text);
      payedType = "2";
    } else {
      descound.text = price.text;
      calAfterDesc(descound.text);
      payedType = "1";
    }
    update();
  }

  @override
  void dateSearch(DateTime startD, DateTime endD) async {
    statusRequs = StatusRequst.loading;
    update();

    var res = await RenewData().dateSearch({
      "start_date": startD.toString().substring(0, 11),
      "end_date": endD.toString().substring(0, 11),
    });
    if (res["status"] == "failure") {
      renewList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      renewList = [];
      renewList.addAll(data.map((e) => RenewModel.fromJson(e)));
      renewUser = renewList[0];
      update();
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
      handlTable(isdateSearch);
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
    var res = await RenewData().search({
      "search": searchVal.text,
      "start_date":
          isdateSearch == true ? startSearch.toString().substring(0, 11) : "0",
      "end_date": endSearch.toString().substring(0, 11),
    });
    if (res["status"] == "failure") {
      renewList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      renewList = [];
      renewList.addAll(data.map((e) => RenewModel.fromJson(e)));
      assignDataInsideTable();

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
    var res = await RenewData().view();
    if (res["status"] == "failure") {
      renewList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];

      renewList = [];
      renewList.addAll(data.map((e) => RenewModel.fromJson(e)));
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

  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < renewList.length; i++) {
      dataInTable.add([
        renewList[i].renewalId.toString(),
        renewList[i].barcode.toString(),
        "${renewList[i].renewalCreate!.year}/${renewList[i].renewalCreate!.month}/${renewList[i].renewalCreate!.day}",
        renewList[i].usersId.toString(),
        renewList[i].usersName.toString(),
        "${renewList[i].renewalStart!.year}/${renewList[i].renewalStart!.month}/${renewList[i].renewalStart!.day}",
        "${renewList[i].renewalEnd!.year}/${renewList[i].renewalEnd!.month}/${renewList[i].renewalEnd!.day}",
        renewList[i].renewalSessionAttend.toString(),
        renewList[i].renewalNote.toString(),
      ]);
    }
  }

  @override
  void gotoFrezze(RenewModel privteModel) async {
    Get.toNamed(AppRoute.freezescreenid,
        arguments: {"RenewModel": privteModel, "subModel": subscriptionModel});
  }

  @override
  void deleteRenew() async {
    var res = await RenewData().delete({
      "id": renewUser.renewalId.toString(),
    });

    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      renewList
          .removeWhere((element) => element.renewalId == renewUser.renewalId);
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  editPRenew() async {
    if (formKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();
      var res = await RenewData().edit({
        "id": renewUser.renewalId.toString(),
        "name": renewUser.usersName,
        "captineId": renewUser.usersCaptiantid.toString(),
        "subscriptionsId": subscriptionModel.subscriptionsId.toString(),
        "note": note.text,
        "start": start.toString(),
        "end": end.toString(),
        "offer": descound.text,
        "amount": amount.text,
        "amount_owed": remining.text,
        "renewal_adminId": myServices.sharedPreferences.getString("id"),
      });
      if (res["status"] == "failure") {
        globalAlert("لم يتم تعديل البيانات لأنها لم تتغير", title: "عذرًا");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        globalAlert("تم تعديل البانات بنجاح", title: "");
        cleaModel();
        handlTable(isdateSearch);
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  void assignModel(RenewModel privetModel) {
    renewUser = privetModel;
    barcodeNum.text = privetModel.barcode.toString();
    userName.text = privetModel.usersName.toString();
    phone.text = privetModel.usersPhone ?? "";
    trainerValue = privetModel.captainNamme ?? trainerNameList[0];
    start = privetModel.renewalStart ?? DateTime.now();
    if (privetModel.renewalStart == null) {
      setEndDate(start!);
    } else {
      end =
          privetModel.renewalEnd; /////////////////////////////////////////////
    }
    subValue = privetModel.subscriptionsName ?? subNameList[0];
    changemodel(subValue);

    preNote.text = privetModel.renewalNote ?? "";
    if (renewUser.renewalStart != null) {
      amount.text = privetModel.renewalAmount.toString();
      descound.text = privetModel.renewOffer.toString();
      notknow.text = privetModel.renewAmountOwed.toString();
      remining.text = notknow.text;
    }

    canAdd = false;
    update();
  }

  void caluserPayd() {
    double disc = subscriptionModel.subscriptionsPrice -
        (renewUser.renewalAmount! + renewUser.renewAmountOwed!);
    descound.text = disc.toString();
    afterDescound.text = price.text;
  }

  void cleaModel() {
    changemodel(subValue);
    barcodeNum.clear();
    userName.clear();
    phone.clear();
    preNote.clear();
    start = DateTime.now();
    remining.clear();
    setEndDate(start!);
    remining.text = "0";
    descound.text = "0";
    canAdd = true;

    update();
  }
}
