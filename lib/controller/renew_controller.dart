import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/functions/global_alert.dart';
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
}

class RenewControllerImp extends RenewController {
  StatusRequst statusRequs = StatusRequst.non;

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
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();

  String trainerValue = "عام";
  String subValue = "عام";

  late String _amountMid;
  late TextEditingController end;
  DateTime start = DateTime.now();

  @override
  void onInit() {
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
    end = TextEditingController();
    searchVal = TextEditingController();
    preNote.text = " ";
    descound.text = "0";
    amount.text = "0";
    remining.text = "0";
    notknow.text = "0";

    getSub();
    getTrainer();
    dateSearch(startSearch, endSearch);
    update();

    viewAll();

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
      setEndDate(start);
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
      double mid = double.parse(_amountMid) - double.parse(payed);
      remining.text = mid.toString();
    } catch (e) {
      descound.text = "0";
      amount.text = price.text;
      afterDescound.text = price.text;
    }
  }

  @override
  void setEndDate(DateTime start) {
    DateTime endMid;
    endMid = start.add(Duration(days: subscriptionModel.subscriptionsDay));
    String time = endMid.toString();
    end.text = time.substring(0, 11);
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
        userName.text = renewUser.usersName!;
        phone.text = renewUser.usersPhone!;
        preNote.text = renewUser.renewalNote ?? " ";

        if (renewUser.subscriptionsName != null) {
          for (int i = 0; i < subNameList.length; i++) {
            if (renewUser.subscriptionsName == subNameList[i]) {
              subValue = subNameList[i];
              update();
            }
          }
        } else {}
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
    String offe = _getDesc();
    String ow = _getowed();
    var res = await RenewData().add({
      "userid": renewUser.usersId.toString(),
      "name": renewUser.usersName,
      "captinId": renewUser.usersCaptiantid.toString(),
      "barcodeId": renewUser.barcodeId.toString(),
      "subscriptionsId": renewUser.subscriptionsId.toString(),
      "note": note.text,
      "start": start.toString(),
      "end": end.text,
      "offer": offe,
      "amount": amount.text,
      "amount_owed": ow,
      "renewal_adminId": "1",
    });
    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق",title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  String _getDesc() {
    double x = double.parse(descound.text);
    if (x > 0) {
      return "1";
    } else {
      return "0";
    }
  }

  String _getowed() {
    double x = double.parse(remining.text);
    if (x > 0) {
      return remining.text;
    } else {
      return "0";
    }
  }

  @override
  void dateSearch(DateTime startD, DateTime endD) async {
    statusRequs = StatusRequst.loading;
    update();
    if (isdateSearch) {
      var res = await RenewData().dateSearch({
        "start_date": startD.toString().substring(0, 11),
        "end_date": endD.toString().substring(0, 11),
      });
      if (res["status"] == "failure") {
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        List data = res["data"];
        renewList.addAll(data.map((e) => RenewModel.fromJson(e)));
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
    var res = await RenewData().search({"search": searchVal.text});
    if (res["status"] == "failure") {
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
  void handlTable(bool isdate) {
    isdateSearch = isdate;

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
        renewList[i].usersCreate.toString(),
        renewList[i].barcode.toString(),
        renewList[i].usersName.toString(),
        renewList[i].usersId.toString(),
        renewList[i].renewalCreate.toString(),
      ]);
    }
  }
 
  @override
  void gotoFrezze(RenewModel privteModel) {
    
    if (privteModel.renewalEnd?.isAfter(DateTime.now()) ?? false) {
     Get.toNamed(AppRoute.freezescreenid,arguments: {
        "RenewModel"  : privteModel
    });
    }else{

      globalAlert("اللاعب اشتراكه منتهي",title: "!خطأ");

    }
  }

@override
  void deleteRenew()async{
     var res = await RenewData().delete(
      {
        "id" : renewUser.renewalId.toString(),
      }
     );
     
     if(res["status"] =="failure")
     {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق",title: "!خطأ");
      statusRequs = StatusRequst.failure;
     }else if(res["status"] =="success"){
      
      renewList.removeWhere((element) => element.renewalId ==renewUser.renewalId) ;
      statusRequs =StatusRequst.sucsess;
     }
     else{
      statusRequs =StatusRequst.failure;
     }
     update();
  }

}
