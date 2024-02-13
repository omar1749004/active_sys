import 'dart:io';

import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/data/models/sub_mode.dart';
import 'package:active_system/data/models/user_model.dart';
import 'package:active_system/data/service/remote/sub_data.dart';
import 'package:active_system/data/service/remote/trainer_data.dart';
import 'package:active_system/data/service/remote/users_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MangeUsersController extends GetxController {
  void getSub();
  void getTrainer();
  void changemodel(String subName);
  void changeTrainermodel(String trainerName);
  void addUsers();
  void view();
  void changeBorrowed(bool x);
  void changeActiveSearch(bool x);
  void changeExpire(bool x);
  void changeDate(bool x);
  void handleAge();
  void handleBarcode();
  void changeActiveSub(bool x);
  void deletePlayers();
  void editPlayers();
}

class MangeUsersControllerImp extends MangeUsersController {
  StatusRequst statusRequs = StatusRequst.non;
 StatusRequst firstState = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? file;

  late TextEditingController barcodeNum;
  late TextEditingController userName;
  late TextEditingController note;
  late TextEditingController phone;
  late TextEditingController age;
  late TextEditingController price;

  late TextEditingController searchVal;

  final List<SubscriptionModel> _subList = [];
  List<String> subNameList = ["عام"];
  final List<UserModel> _trainerList = [];
  late List<UserModel> usersList = [];
  List<List<String>> dataInTable = [];
  List<String> trainerNameList = ["عام"];

  late SubscriptionModel subscriptionModel;
  late UserModel userModel;
  late UserModel trainerModel;

  DateTime startSearch = DateTime.now();
  String borrowed = "0";
  String activeSearch = "0";
  String expire = "0";
  String subscroptionId = "0";

  bool isborrowed = false;
  bool isactiveSearch = false;
  bool isactiveSub = false;
  bool isexpire = false;
  bool issubscroptionId = false;
  bool isDateSearch = false;
  bool isSearch = false;

  DateTime brithdate = DateTime.now();

  int totalPlayers = 0;

  String gender = "0";
  String trainerValue = "عام";
  String subValue = "عام";
  String active = "0";

  @override
  void onInit() async{
    barcodeNum = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    note = TextEditingController();
    price = TextEditingController();
    searchVal = TextEditingController();
    age = TextEditingController();
    age.text = "0";
    firstState = StatusRequst.loading;
    await  Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;
    getSub();
    getTrainer();
    view();
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
      price.text = subscriptionModel.subscriptionsPrice.toString();
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
      trainerModel = _trainerList[0];
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
        price.text = subscriptionModel.subscriptionsPrice.toString();
      }
    }
  }

  void changeSearchmodel(String subName) {
    if (subName == "الكل") {
      subscroptionId = "0";
    }
    for (int i = 0; i < subNameList.length; i++) {
      if (_subList[i].subscriptionsName == subName) {
        subscroptionId = _subList[i].subscriptionsId.toString();
      }
    }
  }

  @override
  void changeTrainermodel(String trainerName) {
    for (int i = 0; i < subNameList.length; i++) {
      if (_trainerList[i].usersId.toString() == trainerName) {
        userModel = _trainerList[i];
      }
    }
  }

  @override
  void addUsers() async {
    statusRequs = StatusRequst.loading;
    update();

    if (formKey.currentState!.validate()) {
      if (file != null) {
        var res = await UsersData().add({
          "name": userName.text,
          "phone": phone.text,
          "note": note.text,
          "gender": gender,
          "date": brithdate.toString().substring(0, 11),
          "captinId": trainerModel.usersCaptiantId.toString(),
          "subscriptionsId": subscriptionModel.subscriptionsId.toString(),
          "adminId": "1",
          "active": active,
          "barcodeNum": barcodeNum.text,
        }, file!);
        if (res["msg"] == "renewal") {
          globalAlert("مشكلة في التجديد");
          statusRequs = StatusRequst.failure;
        } else if (res["status"] == "success") {
          barcodeNum.clear() ;
          userName.clear() ;
          phone.clear() ;
          note.clear() ;
          age.clear() ;
          statusRequs = StatusRequst.sucsess;
        } else if (res["msg"] == "barcode is used") {
          globalAlert("هذا الكود مستخدم بالفعل");
          statusRequs = StatusRequst.failure;
        }
      } else {
        globalAlert("يجب ادخال صورة اللاعب");
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
      view();
    }
    update();
  }

  @override
  void view() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await UsersData().search({
      "creat": startSearch.toString().substring(0, 7),
      "borrowed": borrowed,
      "active": activeSearch,
      "expire": expire,
      "subscroption": subscroptionId,
      "search": searchVal.text
    });
    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      totalPlayers = res["totalPlayer"];
      usersList = [];
      usersList.addAll(data.map((e) => UserModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    await  Future.delayed(const Duration(milliseconds: 300));
    update();
  }

  @override
  void changeActiveSearch(bool x) {
    if (x == isactiveSearch) {
      isactiveSearch = !x;
      activeSearch = isactiveSearch ? "1" : "0";
      update();
      view();
    }
  }

  @override
  void changeBorrowed(bool x) {
    if (x == isborrowed) {
      isborrowed = !x;
      borrowed = isborrowed ? "1" : "0";
      update();
      view();
    }
  }

  @override
  void changeExpire(bool x) {
    if (x == isexpire) {
      isexpire = !x;
      expire = isexpire ? "1" : "0";
      update();
      view();
    }
  }

  @override
  void changeDate(bool x) {
    if (x == isDateSearch) {
      isDateSearch = !x;
      expire = isDateSearch ? "1" : "0";
      update();
      view();
    }
  }

  @override
  void handleAge() {
    double? mid = double.tryParse(age.text);
    if (mid == null) {
      age.text = "0";
    }
  }

  @override
  void handleBarcode() {
    double? mid = double.tryParse(barcodeNum.text);
    if (mid == null) {
      barcodeNum.text = "";
    }
  }

  @override
  void changeActiveSub(bool x) {
    if (x == isactiveSub) {
      isactiveSub = !x;
      active = isactiveSub ? "1" : "0";
      update();
    }
  }

  @override
  void deletePlayers() async {
    var res = await UsersData().delete({
      "id": userModel.usersId.toString(),
      "imageName": userModel.usersImage,
    });

    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      usersList.removeWhere((element) => element.usersId == userModel.usersId);
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }


  @override
  editPlayers() async {
    if (formKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();
      var res = await UsersData().edit({
        "id": userModel.usersId.toString(),
        "name": userName.text,
        "phone": phone.text,
        "note": note.text,
        "gender": gender,
        "date": brithdate.toString().substring(0, 11),
        "captinId": trainerModel.usersCaptiantId.toString(),
        "subscriptionsId": subscriptionModel.subscriptionsId.toString(),
        "adminId": "1",
        "active": active,
        "oldimagename": userModel.usersImage,
        "barcodeNum": barcodeNum.text,
      }, file: file!);
      if (res["status"] == "failure") {
        globalAlert("لم يتم تعديل البيانات لأنها لم تتغير", title: "عذرًا");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        globalAlert("تم تعديل البانات بنجاح", title: "");
          barcodeNum.clear() ;
          userName.clear() ;
          phone.clear() ;
          note.clear() ;
          age.clear() ;
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
  
      update();
    }
}

  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < usersList.length; i++) {
      dataInTable.add([
        usersList[i].usersAddress.toString(),
        usersList[i].usersCreate.toString(),
        usersList[i].usersBranch.toString(),
        usersList[i].usersName.toString(),
        usersList[i].usersId.toString(),
        usersList[i].usersName.toString(),
      ]);
    }
  }
}
