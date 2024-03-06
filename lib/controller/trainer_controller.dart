import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/data/models/user_model.dart';
import 'package:active_system/data/service/remote/trainer_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class TrainersController extends GetxController {
  void viewAll();
  void checkSearch(String val);
  void addTrainer();
  void assignModel(UserModel privetModel);
  void organizePhone();
  void deleteTrainer();
  void editTrainer();
  void cleaModel();
  void selectRow(int assignSelect) ;
}

class TrainersControllerImp extends TrainersController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<UserModel> usersList = [];
  List<TrainerNumberModel> phonesList = [];

  List<List<String>> dataInTable = [];

  late UserModel userModel;
  Map<int, List<String>> phoneMap = {};
  int selectedIndex = -1;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController phone1;
  late TextEditingController phone2;
  late TextEditingController address;
  late TextEditingController note;

  late TextEditingController search;
  bool canAdd = true;
  @override
  void onInit() async {
    name = TextEditingController();
    phone = TextEditingController();
    phone1 = TextEditingController();
    phone2 = TextEditingController();
    address = TextEditingController();
    note = TextEditingController();
    search = TextEditingController();
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 300));
    firstState = StatusRequst.failure;
   viewAll();
    super.onInit();
  }

  @override
  void viewAll() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await TrainerData().view();
    if (res["status"] == "failure") {
      usersList = [];
      phonesList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      usersList = [];
      phonesList = [];
      usersList.addAll(data.map((e) => UserModel.fromJson(e)));
      data = res["phone"];
      phonesList.addAll(data.map((e) => TrainerNumberModel.fromJson(e)));
      organizePhone();
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    await Future.delayed(const Duration(milliseconds: 300));
    update();
  }

  @override
  void organizePhone() {
    for (var phoneUsers in phonesList) {
      phoneMap[phoneUsers.userid!] ??= [];
      phoneMap[phoneUsers.userid]!.add(phoneUsers.phone!);
    }
  }

  @override
  void addTrainer() async {
    if (formKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();
      var res = await TrainerData().add(
        {
          "name": name.text,
          "phone": phone.text,
          "adress": address.text,
          "note": note.text,
          "phone1": phone1.text,
          "phone2": phone2.text,
        },
      );
      if (res["status"] == "failure") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        viewAll();
        cleaModel();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  void checkSearch(String val) {
    if (val.isEmpty) {
      viewAll();
    } else {
      _search();
    }
    update();
  }

  void _search() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await TrainerData().search({"search": search.text});

    if (res["status"] == "failure") {
      usersList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      usersList = [];
      usersList.addAll(data.map((e) => UserModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void assignModel(UserModel privetModel) {
    address.text = privetModel.usersAddress ?? "";
    
    name.text = privetModel.usersName ?? "";
    note.text = privetModel.usersNote ?? "";
    userModel = privetModel;
    List<String> mid = phoneMap[privetModel.usersId]!;
    phone.clear();
    phone1.clear();
    phone2.clear();
    if (mid.isNotEmpty) {
      phone.text = mid[0];
      if (mid.length > 1) {
        phone1.text = mid[1];
        if (mid.length > 2) {
          phone2.text = mid[2];
        }
      }
    }

    canAdd = false;
    update();
  }

  @override
  void deleteTrainer() async {
    var res = await TrainerData().delete({
      "id": userModel.usersId.toString(),
    });

    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      usersList.removeWhere((element) => element.usersId == userModel.usersId);
      assignDataInsideTable();
      cleaModel();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < usersList.length; i++) {
      dataInTable.add([
        usersList[i].usersId.toString(),
        usersList[i].usersName.toString(),
        usersList[i].usersPhone.toString(),
        usersList[i].usersAddress.toString(),
        usersList[i].usersNote.toString(),
      ]);
    }
  }

  @override
  void editTrainer() async {
    statusRequs = StatusRequst.loading;
    update();
    if (formKey.currentState!.validate()) {
      var res = await TrainerData().add(
        {
          "id": userModel.usersId.toString(),
          "name": name.text,
          "phone": phone.text,
          "adress": address.text,
          "note": note.text,
          "phone1": phone1.text,
          "phone2": phone2.text,
        },
      );
      if (res["status"] == "failure") {
        globalAlert("لم يتم تعديل البيانات لأنها لم تتغير", title: "عذرًا");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        globalAlert("تم تعديل البانات بنجاح", title: "");
        cleaModel();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }

      update();
    }
  }

  @override
  cleaModel() {
    name.clear();
    phone.clear();
    phone1.clear();
    phone2.clear();
    address.clear();
    note.clear();
    canAdd = true;
    selectedIndex  = -1 ;

    update();
  }
  
  @override
  void selectRow(int assignSelect) {
      if (selectedIndex ==  assignSelect) {
                   selectedIndex = -1; // Reset if tapped again
                   cleaModel() ;
                  } else {
                   selectedIndex = assignSelect;
                  }
  }
}
