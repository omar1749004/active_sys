import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/data/models/admin_mode.dart';
import 'package:active_system/data/models/adminpowers_model.dart';
import 'package:active_system/data/service/remote/admin_data.dart';
import 'package:active_system/features/users/data/service/static/powers_list.dart';
import 'package:flutter/cupertino.dart';
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
  void deleteAdmin();
  void assignModel(AdminSys privetModel , int index);
  void editAdmin();
  void checkSearch(String val);
  void cleaModel();
}

class AdminControllerImp extends AdminController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;
  late TextEditingController search;
  List<AdminPower> adminPoewrList = [];
  List<AdminSys> adminmodelList = [];
  List<List<String>> dataInTable = [];
  late AdminSys adminmModel;
  late TextEditingController name;
  late TextEditingController pass;
  late TextEditingController repass;
  late TextEditingController note;
  bool isHidepass = true;
  bool canAdd = true;
  IconData icone = CupertinoIcons.eye_slash;
  List<int> selectpowerList = [1, 2, 3, 4, 5, 6, 7, 8, 9,];
  List<Map<int, List<int>>> powersMap = [];
  GlobalKey<FormState> formAdminKey = GlobalKey<FormState>();
  MyServices myServices =Get.find();
  @override
  void onInit() async {
    search = TextEditingController();
    name = TextEditingController();
    note = TextEditingController();
    pass = TextEditingController();
    repass = TextEditingController();
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;
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
      adminmodelList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      adminmodelList = [];
      adminmodelList.addAll(data.map((e) => AdminSys.fromJson(e)));
      data = res["powers"];
      adminPoewrList.addAll(data.map((e) => AdminPower.fromJson(e)));
      organizePowers();
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    await Future.delayed(const Duration(milliseconds: 100));
    update();
  }

  //handle power in map
  @override
  void organizePowers() {
   for (int i = 0; i < adminmodelList.length; i++) {
    powersMap.add({});

    for (int j = 0; j < adminPoewrList.length; j++) {
 if (adminPoewrList[j].adminId == adminmodelList[i].adminSysId) {
        powersMap[i][adminPoewrList[j].adminId] ??= [];
        powersMap[i][adminPoewrList[j].adminId]!.add(adminPoewrList[j].powerId);
      }
    }
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
    List<bool> result = List.filled(9, false);

    for (int i = 0; i < selectpower.length; i++) {
        result[selectpower[i] - 1] = true;
      
    }
    checkValueList = List.from(result);
    update();
  }

  @override
  void assignModel(AdminSys privetModel, int index) {
    name.text = privetModel.adminSysName;
    pass.text = privetModel.adminSysPassword ;
    note.text = privetModel.adminSysNote.toString();
    repass.text = privetModel.adminSysPassword ;
    adminmModel = privetModel;
    canAdd = false;
    adminmModel = privetModel;

      assignSelectAdminPowers(powersMap[index][adminmModel.adminSysId]!);
    update();
  }

  @override
  void addAdmin() async {
    if (formAdminKey.currentState!.validate()) {
      if (pass.text != repass.text) {
        globalAlert("كلمة المرور التي أدخلتها غير ", title: "عذرًا");
      } else {
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
          globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
          statusRequs = StatusRequst.failure;
        } else if (res["status"] == "success") {
          cleaModel();
          getPowers();
          statusRequs = StatusRequst.sucsess;
        } else {
          statusRequs = StatusRequst.failure;
        }
      }
      update();
    }
  }

  @override
  void deleteAdmin() async {
    var res = await AdminData().delete({
      "id": adminmModel.adminSysId.toString(),
    });

    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      adminmodelList.removeWhere(
          (element) => element.adminSysId == adminmModel.adminSysId);
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  editAdmin() async {
    if (formAdminKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();

      var res = await AdminData().edit({
        "id": adminmModel.adminSysId.toString(),
        "name": name.text,
        "type": "0",
        "password": pass.text,
        "note": note.text,
        "powers": selectpowerList.toString(),
      });

      if (res["status"] == "failure") {
        globalAlert("لم يتم تعديل البيانات لأنها لم تتغير", title: "عذرًا");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        globalAlert("تم تعديل البانات بنجاح", title: "");
        statusRequs = StatusRequst.sucsess;
        cleaModel() ;
        getPowers();
      } else {
        statusRequs = StatusRequst.failure;
      }
      update();
    }
  }

  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < adminmodelList.length; i++) {
      dataInTable.add([
        adminmodelList[i].adminSysId.toString(),
        adminmodelList[i].adminSysName.toString(),
        adminmodelList[i].adminSysType.toString(),
        adminmodelList[i].adminSysNote.toString(),
      ]);
    }
  }
  
  @override
  void checkSearch(String val) {
    if (val.isEmpty) {
      getPowers();
    } else {
      _search();
    }
    update();
  }

  void _search() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await AdminData().search({"search": search.text});
    if (res["status"] == "failure") {
      adminmodelList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      adminmodelList = [];
      adminmodelList.addAll(data.map((e) => AdminSys.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void cleaModel() {
    name.clear();
    pass.clear();
    repass.clear();
    note.clear();
    checkValueList = List.filled(14, true);
    canAdd = true;
    update();
  }

}
