import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/data/models/admin_mode.dart';
import 'package:active_system/data/models/adminpowers_model.dart';
import 'package:active_system/data/service/remote/admin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/menu_items.dart';

abstract class AuthController extends GetxController {
  void changeIcone();
  void showPassword();
  void organizePowers();
  void login();
  void assignSelectAdminPowers(List<int> selectpower);
  void setPowersInMenu();
}

class AuthControllerImp extends AuthController {
  StatusRequst statusRequs = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MyServices services = Get.find();
  late TextEditingController name;
  late TextEditingController password;
  IconData icone = CupertinoIcons.eye_slash;
  List<AdminPower> adminPoewrList = [];
  late AdminSys adminModel;
  Map<int, List<int>> powersMap = {};

  bool isHidepass = true;

  @override
  void onInit() {
    name = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();
      var res = await AdminData()
          .login({"name": name.text, "password": password.text});
      if (res["msg"] == "wrong pass") {
        statusRequs = StatusRequst.failure;
        globalAlert("اسم المستخدم أو كلمة المرور غير صحيحة");
      } else if (res["status"] == "success") {
        adminModel = AdminSys.fromJson(res["data"]);
        List data = res["powers"];
        adminPoewrList.addAll(data.map((e) => AdminPower.fromJson(e)));
        organizePowers();
        //maybe there error here ('_')
        assignSelectAdminPowers(powersMap[adminModel.adminSysId]!);

        services.sharedPreferences
            .setString("id", adminModel.adminSysId.toString());
        services.sharedPreferences.setString("name", adminModel.adminSysName);

        statusRequs = StatusRequst.sucsess;
        Get.offNamed(AppRoute.homeid);
      } else if (res["msg"] == "no powers") {
        servicePowerName = [];
        servicePowerRoutes = [];

        //to add الصفحه الرئيسيه
        servicePowerName.add(serviceName[0]);
        servicePowerRoutes.add(serviceRoutes[0]);

        //to add تسجيل الدخول
        servicePowerName.add(serviceName.last);
        servicePowerRoutes.add(serviceRoutes.last);
        services.sharedPreferences
            .setStringList("servicePowerName", servicePowerName);
        services.sharedPreferences
            .setStringList("servicePowerRoutes", servicePowerRoutes);
        Get.offNamed(AppRoute.homeid);
      }
    }

    update();
  }

  @override
  void organizePowers() {
    for (var adminPower in adminPoewrList) {
      powersMap[adminPower.adminId] ??= [];
      powersMap[adminPower.adminId]!.add(adminPower.powerId);
    }
  }

  @override
  showPassword() {
    isHidepass = !isHidepass;
    update();
  }

  @override
  void changeIcone() {
    icone = isHidepass ? CupertinoIcons.eye_slash : CupertinoIcons.eye;
    update();
  }

  @override
  void assignSelectAdminPowers(List<int> selectpower) async {
    booleansPowers = List.filled(9, false);

    for (int i = 0; i < selectpower.length; i++) {
      if (i < selectpower.length) {
        booleansPowers[selectpower[i] - 1] = true;
      }
    }
    setPowersInMenu();
    update();
  }

//function to handle pages in menu
  @override
  void setPowersInMenu() async {
    var j = 0;

    servicePowerName = [];
    servicePowerRoutes = [];

    //to add الصفحه الرئيسيه
    servicePowerName.add(serviceName[0]);
    servicePowerRoutes.add(serviceRoutes[0]);

    //to add other pages
    for (; j < booleansPowers.length; j++) {
      if (booleansPowers[j]) {
        servicePowerName.add(serviceName[j + 1]);
        servicePowerRoutes.add(serviceRoutes[j + 1]);
      } else {
        continue;
      }
    }

    //to add تسجيل الدخول
    servicePowerName.add(serviceName.last);
    servicePowerRoutes.add(serviceRoutes.last);
    services.sharedPreferences
        .setStringList("servicePowerName", servicePowerName);
    services.sharedPreferences
        .setStringList("servicePowerRoutes", servicePowerRoutes);
    update();
  }
}
