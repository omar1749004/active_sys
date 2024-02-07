// import 'package:active_system/data/service/remote/admin_data.dart';

import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/data/models/admin_mode.dart';
import 'package:active_system/data/models/adminpowers_model.dart';
import 'package:active_system/data/service/remote/admin_data.dart';
import 'package:active_system/features/users/data/service/static/powers_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AdminController extends GetxController {
  void showPassword();
  void changeIcone();
  void getPowers();
  void organizePowers();
  void handleselectPoewr(int power, bool isSelect);
  void changecheckvalue(int index, bool value);
  void assignSelectAdminPowers(List<int> selectpower);
  void addAdmin();
}

class AdminControllerImp extends AdminController {
  StatusRequst statusRequs = StatusRequst.non;
  late TextEditingController search;
  List<AdminPower> adminPoewrList = [];
  List<AdminSys> adminmodelList = [];
  late TextEditingController name;
  late TextEditingController pass;
  late TextEditingController repass;
  late TextEditingController note;
  bool isHidepass = true;
  IconData icone = CupertinoIcons.eye_slash;
  List<int> selectpowerList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  Map<int, List<int>> powersMap = {};
  GlobalKey<FormState> formAdminKey = GlobalKey<FormState>();
  @override
  void onInit() {
    search = TextEditingController();
    name = TextEditingController();
    note = TextEditingController();
    pass = TextEditingController();
    repass = TextEditingController();
    getPowers();
    super.onInit();
  }

  @override
  void showPassword() {
    isHidepass = !isHidepass;
    update();
  }

  @override
  void changeIcone() {
  icone = isHidepass ? CupertinoIcons.eye_slash : CupertinoIcons.eye;
    update();
  }

  @override
  void getPowers() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await AdminData().view();
    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      adminmodelList.addAll(data.map((e) => AdminSys.fromJson(e)));
      data = res["powers"];
      adminPoewrList.addAll(data.map((e) => AdminPower.fromJson(e)));
      organizePowers();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }

    update();
  }

  //handle power in map
  @override
  void organizePowers() {
    for (var adminPower in adminPoewrList) {
      powersMap[adminPower.adminId] ??= [];
      powersMap[adminPower.adminId]!.add(adminPower.powerId);
    }
  }

// handle power list
  @override
  void handleselectPoewr(int power, bool isSelect) {
    if ((isSelect && !selectpowerList.contains(power)) ||
        (!isSelect && selectpowerList.contains(power))) {
      if (isSelect) {
        selectpowerList.add(power);
      } else {
        selectpowerList.remove(power);
      }
    }
  }

  @override
  void changecheckvalue(int index, bool value) {
    if (checkValueList[index] != value) {
      checkValueList[index] = value;
      update();
    }
  }

  @override
  void assignSelectAdminPowers(List<int> selectpower) {
    List<bool> result = List.filled(14, false);

    for (int i = 0; i < selectpower.length; i++) {
      if (i < selectpower.length) {
        result[selectpower[i] - 1] = true;
      }
    }
    checkValueList = List.from(result);
    update();
  }

  @override
  void addAdmin() async {
     if (formAdminKey.currentState!.validate()) {
      if(pass.text!=repass.text)
      {
       Get.defaultDialog(
       title :"Waring",
        middleText: "Password Not Match",actions: [
      ElevatedButton(onPressed: (){
        Get.back();
      }, child:const Text("Ok")) ]
       );
      }else{
      statusRequs = StatusRequst.loading;
      update();
      
      var res = await AdminData().add(
        {
          "name": name.text,
          "type": "0",
          "password": pass.text,
          "note": note.text,
          "powers": selectpowerList.toString(),
        },
      );
      if (res["status"] == "failure") {
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    }
      }
    update();
  }
}

// var res = await AdminData().add(
//   {
//     "name": text,
//     "type": type,
//     "password": sha1(password.text),
//     "note": note,
//     "powers": powers,
//   },
// );

// var res = await AdminData().edit(
//   {
//    "id": id,
//   "name": name,
//   "type": type,
//   "password": sha1(password.text),
//   "note": note,
//   "powers": powers,
//   }

// );
// var res = await AdminData().delete(
//   {
//    "id": id
//   }

// );
