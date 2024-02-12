import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/data/models/freeze_mode.dart';
import 'package:active_system/data/models/renew_model.dart';
import 'package:active_system/data/service/remote/freeze_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FreezeController extends GetxController {
  void addFreeze();
  void getFreeze();
  void initialData();
  void calcDays();
  void deleteFreeze();
  void assignModel(FreezeModel privetModel);
}

class FreezeControllerImp extends FreezeController {
  StatusRequst statusRequs = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<FreezeModel> freezeList = [];
  late FreezeModel freezeModel;
  late RenewModel renewUser;

  late TextEditingController day;
  late TextEditingController note;
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();
  String? barcode;
  String? name;
  String? startrenew;
  String? endrenew;
  String? subName;
  String? days;
  int? frezzeDay;
  int? freezeNum;
  int? maxFreeze;

  @override
  void onInit() {
    day = TextEditingController();
    note = TextEditingController();
    day.text = "0";
    initialData();

    super.onInit();
  }

  @override
  void initialData() {
    renewUser = Get.arguments["RenewModel"];
    getFreeze();
    name = renewUser.usersName;
    barcode = renewUser.barcode.toString();
    startrenew = renewUser.renewalStart.toString();
    endrenew = renewUser.renewalEnd.toString();
    subName = renewUser.subscriptionsName;
    days = renewUser.subscriptionsDay.toString();
  }

  @override
  void getFreeze() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await FrezzeData().view({
      "renewal_id": renewUser.renewalId.toString(),
      "subscriptions_id": renewUser.subscriptionsId.toString(),
    });

    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["freeze"];
      //print(data);
      frezzeDay = res["data"]["frezz_day"];
      freezeNum = res["data"]["frezz_number"];
      maxFreeze = res["data"]["max_frezz_day"];
      freezeList = [];
      freezeList.addAll(data.map((e) => FreezeModel.fromJson(e)));
      statusRequs = StatusRequst.sucsess;
    } else if (res["status"] == "sub") {
      frezzeDay = res["data"]["frezz_day"];
      freezeNum = res["data"]["frezz_number"];
      maxFreeze = res["data"]["max_frezz_day"];
      statusRequs = StatusRequst.sucsess;
    }
    update();
  }

  @override
  void addFreeze() async {
    statusRequs = StatusRequst.loading;
    update();
    String? msg;

    if (formKey.currentState!.validate()) {
      if (freezeList.isEmpty) {
        if (int.parse(day.text) > frezzeDay!) {
          msg = "عدد ايام التجدميد أكبر من الاعدد المتاح";
        }
      } else {
        int x = 0;
        for (int i = 0; i < freezeList.length; i++) {
          x = freezeList[i].freezeDay + x;
        }
        if (x + int.parse(day.text) > frezzeDay!) {
          msg = "عدد ايام التجدميد أكبر من الاعدد المتاح";
        }
      }

      if (msg == null) {
        var res = await FrezzeData().add(
          {
            "start": startSearch.toString().substring(0, 11),
            "end": endSearch.toString().substring(0, 11),
            "userId": renewUser.usersId.toString(),
            "renewal_id": renewUser.renewalId.toString(),
            "note": note.text,
            "frezz_day": day.text,
            "adminId": "1",
          },
        );

        if (res["msg"] == "unavilbe") {
          globalAlert("الاعب تخطى عدد مرات التجميد");
          statusRequs = StatusRequst.failure;
        } else if (res["status"] == "success") {
          getFreeze();
          print("fukkk");
          statusRequs = StatusRequst.sucsess;
        }
      } else {
        globalAlert(msg);
      }
    }
    update();
  }

  @override
  void calcDays() {
    if (startSearch == endSearch) {
      day.text = "0";
    } else {
      Duration difference = endSearch.difference(startSearch);
      int midDay = difference.inDays;
      midDay = midDay + 1;
      day.text = midDay.toString();
    }
  }

  @override
  void assignModel(FreezeModel privetModel) {
    freezeModel = privetModel;
  }

  @override
  void deleteFreeze() async {
    var res = await FrezzeData().delete({
      "id": freezeModel.freezeId.toString(),
      "freeze_day": frezzeDay.toString(),
      "renewal_end": renewUser.renewalEnd.toString(),
      "renewal_id": freezeModel.freezeRenewalId.toString(),
    });

    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      freezeList
          .removeWhere((element) => element.freezeId == freezeModel.freezeId);
      endrenew = renewUser.renewalEnd!
          .subtract(Duration(days: freezeModel.freezeDay))
          .toString();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }
}

// import 'package:active_system/data/service/remote/trainer_data.dart';


// var res = await TrainerData().edit(
//   {
//     "id": text,
//     "name": type,
//     "phone": sha1(password.text),
//     "adress": note,
//     "note": powers,
//   }

// );
// var res = await TrainerData().search(
//   {
//     "search": id,
//   }
  
// );

// var res = await FrezzeData().add(
//   {
//     "start": text,
//     "end": type,
//     "userId": ,
//     "renewal_id": note,
//     "note": powers,
//     "frezz_day": text,
//     "adminId": type,
//   },
// );

// var res = await FrezzeData().view(
//   {
//    "renewal_id": id,
//   }

// );

