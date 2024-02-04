import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/data/models/sub_mode.dart';
import 'package:active_system/data/models/user_model.dart';
import 'package:active_system/data/service/remote/sub_data.dart';
import 'package:active_system/data/service/remote/trainer_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RenewController extends GetxController {
  void getSub();
  void getTrainer();
  void changemodel(String subName);
  //void calMuny();
}

class RenewControllerImp extends RenewController {
  StatusRequst statusRequs = StatusRequst.non;

  late TextEditingController barcodeNum;
  late TextEditingController sessionNum;
  late TextEditingController dayNum;
  late TextEditingController price;
  late TextEditingController descound;
  late TextEditingController afterDescound;
  late TextEditingController amount;
  late TextEditingController notknow;
  late TextEditingController remining;
  late TextEditingController note;
  final List<SubscriptionModel> _subList = [];
  final List<String> subNameList = ["crdio"];
  final List<UserModel> _trainerList = [];
  final List<String> trainerNameList = ["عام"];
  late SubscriptionModel subscriptionModel;

  @override
  void onInit() {
    barcodeNum = TextEditingController();
    sessionNum = TextEditingController();
    dayNum = TextEditingController();
    price = TextEditingController();
    descound = TextEditingController();
    afterDescound = TextEditingController();
    amount = TextEditingController();
    notknow = TextEditingController();
    remining = TextEditingController();
    note = TextEditingController();
    
   descound.text = "0" ;
   amount.text = "0" ;
   remining.text = "0" ;
   notknow.text ="0";


    getSub();
    getTrainer();
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
      _subList.addAll(data.map((e) => SubscriptionModel.fromJson(e)));
      subNameList.addAll(_subList.map((e) => e.subscriptionsName));
      subscriptionModel = _subList[0];

      sessionNum.text =
      subscriptionModel.subscriptionsSessionsNumber.toString();
      dayNum.text = subscriptionModel.subscriptionsDay.toString();
      price.text = subscriptionModel.subscriptionsPrice.toString();
      afterDescound.text = price.text;
      amount.text = price.text ;
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
      _trainerList.addAll(data.map((e) => UserModel.fromJson(e)));
      trainerNameList.addAll(_trainerList.map((e) => e.usersName!));
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
      }
    }
  }
}






// var res = await RenewData().add(
//   {
//     "userid": text,
//     "name": type,
//     "captinId": ,
//     "barcodeId": note,
//     "subscriptionsId": powers,
//     "note": text,
//     "start": type,
//     "end": sha1(password.text),
//     "offer": note,
//     "amount": powers,
//     "amount_owed": sha1(password.text),
//     "renewal_adminId": note,
//   },
// );
// var res = await RenewData().edit(
//   {
//     "id": text,
//     "userid": text,
//     "name": type,
//     "captinId": ,
//     "barcodeId": note,
//     "subscriptionsId": powers,
//     "note": text,
//     "start": type,
//     "end": sha1(password.text),
//     "offer": note,
//     "amount": powers,
//     "amount_owed": sha1(password.text),
//     "renewal_adminId": note,
//   },
// );

// var res = await RenewData().dateSearch(
//   {
//     "start_date": text,
//     "end_date": text,
//   }

// );
// var res = await RenewData().delete(
//   {
//    "id": id,
//   }
  
// );
// //barcode and name
// var res = await RenewData().search(
//   {
//     "search": text,
//   }
  
// );
// // just barcode 
// var res = await RenewData().usersSearch(
//   {
//     "search": text,
//   }
  
// );