
import 'package:active_system/core/class/handle_data_in_table.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/data/models/sub_mode.dart';
import 'package:active_system/data/models/user_model.dart';
import 'package:active_system/data/service/remote/sub_data.dart';
import 'package:active_system/data/service/remote/trainer_data.dart';
import 'package:active_system/data/service/remote/users_data.dart';
import 'package:camera/camera.dart';
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
  void calcAge();
  void calcBrithday();
  void editPlayers();
  void assignModel(UserModel privetModel);
}

class MangeUsersControllerImp extends MangeUsersController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? file;

  late TextEditingController barcodeNum;
  late TextEditingController userName;
  late TextEditingController note;
  late TextEditingController phone;
  late TextEditingController age;
  late TextEditingController price;
  late TextEditingController searchVal;
  DateTime? brithDay = DateTime.now();
  final List<SubscriptionModel> _subList = [];
  List<String> subNameList = ["عام"];
  List<String> subNameSearchList = ["الكل"];
  final List<UserModel> _trainerList = [];
  late List<UserModel> usersList = [];
  List<List<String>> dataInTable = [];
  List<String> trainerNameList = ["عام"];

  late SubscriptionModel subscriptionModel;
  late UserModel userModel;
  late UserModel trainerModel;
  MyServices myServices =Get.find();
  DateTime startSearch = DateTime.now();
  bool canAdd = true;
  String borrowed = "0";
  String activeSearch = "0";
  String expire = "0";
  String subscroptionId = "0";
  String crate = "0";
  bool isborrowed = false;
  bool isactiveSearch = false;
  bool isactiveSub = false;
  bool isexpire = false;
  bool issubscroptionId = false;
  bool isDateSearch = false;
  bool isSearch = false;


  int totalPlayers = 0;

  String gender = "0";
  String trainerValue = "عام";
  String subValue = "عام";
  String subSearchValue = "الكل";
  String active = "0";

  @override
  void onInit() async {
    barcodeNum = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    note = TextEditingController();
    price = TextEditingController();
    searchVal = TextEditingController();
    age = TextEditingController();
    age.text = "0";
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 100));
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
      subNameSearchList.addAll(_subList.map((e) => e.subscriptionsName));
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
        break;
      }
    }
  }

  void changeSearchmodel(String subName) {
    if (subName == "الكل") {
      subscroptionId = "0";
    } else {
      for (int i = 0; i < subNameList.length; i++) {
        if (_subList[i].subscriptionsName == subName) {
          subscroptionId = _subList[i].subscriptionsId.toString();
          break;
        }
      }
    }

    view();
  }

  @override
  void changeTrainermodel(String trainerName) {
    for (int i = 0; i < trainerNameList.length; i++) {
      if (_trainerList[i].usersName == trainerName) {
        userModel = _trainerList[i];
        break;
      }
    }
  }

  @override
  void addUsers() async {
    statusRequs = StatusRequst.loading;
    update();
    if (formKey.currentState!.validate()) {

        var res = await UsersData().add({
          "name": userName.text,
          "phone": phone.text,
          "note": note.text,
          "gender": gender,
          "date": brithDay.toString().substring(0, 11),
          "captinId": trainerModel.usersId.toString(),
          "subscriptionsId": subscriptionModel.subscriptionsId.toString(),
          "adminId": myServices.sharedPreferences.getString("id"),
          "active": active,
          "barcodeNum": barcodeNum.text,
        }, file: file);
        if (res["msg"] == "renewal") {
          globalAlert("مشكلة في التجديد");
          statusRequs = StatusRequst.failure;
        } else if (res["status"] == "success") {
          cleaModel();
          view();
          statusRequs = StatusRequst.sucsess;
        } else if (res["msg"] == "barcode is used") {
          globalAlert("هذا الكود مستخدم بالفعل");
          statusRequs = StatusRequst.failure;
        }
    } else {
      statusRequs = StatusRequst.failure;
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
      "creat": crate,
      "borrowed": borrowed,
      "active": activeSearch,
      "expire": expire,
      "subscroption": subscroptionId,
      "search": searchVal.text
    });
    if (res["status"] == "failure") {
      usersList = [];
      totalPlayers = 0;
      assignDataInsideTable();
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
    await Future.delayed(const Duration(milliseconds: 200));
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
      crate = isDateSearch ? startSearch.toString().substring(0, 7) : "0";
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
      cleaModel();
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
        "date": brithDay.toString().substring(0, 11),
        "captinId": trainerModel.usersId.toString(),
        "subscriptionsId": subscriptionModel.subscriptionsId.toString(),
        "adminId": myServices.sharedPreferences.getString("id"),
        "active": active,
        "oldimagename": userModel.usersImage,
        "barcodeNum": barcodeNum.text,
      }, file: file);
      if (res["status"] == "failure") {
        globalAlert("لم يتم تعديل البيانات لأنها لم تتغير", title: "عذرًا");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        globalAlert("تم تعديل البانات بنجاح", title: "");
        cleaModel();
        statusRequs = StatusRequst.sucsess;
      } else if (res["msg"] == "barcode is used") {
        globalAlert("هذا الكود مستخدم بالفعل");
        statusRequs = StatusRequst.failure;
      } else if (res["msg"] == "barcode not change") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      }

      update();
    }
  }

  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < usersList.length; i++) {
      dataInTable.add([
        usersList[i].usersId.toString(),
        usersList[i].usersName.toString(),
        handleDataInTable().handleGenderData(usersList[i].usersGender),
        usersList[i].usersPhone.toString(),
        usersList[i].usersCreate.toString(),
        usersList[i].renewalStart.toString(),
        usersList[i].renewalEnd.toString(),
        usersList[i].usersNote.toString(),
      ]);
    }
  }

  @override
  void assignModel(UserModel privetModel) {
    userModel = privetModel;
    barcodeNum.text = privetModel.barcode.toString();
    userName.text = privetModel.usersName.toString();
    phone.text = privetModel.usersPhone!;
    trainerValue = privetModel.captainName!;
    brithDay = privetModel.usersDate ;
    calcAge();
    note.text = privetModel.usersNote!;
    subValue = privetModel.subscriptionsName!;
    changemodel(subValue);
    canAdd = false;
    update();
  }

  void cleaModel() {
    barcodeNum.clear();
    userName.clear();
    phone.clear();
    note.clear();
    age.clear();
    file = null;
    brithDay = DateTime.now();
    canAdd = true;
    update();
  }

  @override
  void calcAge() {
    int midage = DateTime.now().year - brithDay!.year  ;
    age.text = midage.toString() ;

  }

  @override
  void calcBrithday() {
    int midBrithday = DateTime.now().year - int.parse(age.text);
    brithDay = DateTime(midBrithday, 1, 1);
    update();
  }
}
