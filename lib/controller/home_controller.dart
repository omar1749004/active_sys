import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/data/models/attend_model.dart';
import 'package:active_system/data/models/sub_mode.dart';
import 'package:active_system/data/service/remote/attend_data.dart';
import 'package:active_system/data/service/remote/sub_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void addSession();
  void addSub();
  void addInvition();
  void addService();
  void viewAll();
  void getSub();
  void assignModel(AttendModel privetModel);
  void  handlebarcode();
  void  handleFunctionsAdd();
  void rightSearch() ;
  void searchFun();
}

class HomeControllerImp extends HomeController {
  StatusRequst statusRequs = StatusRequst.non;

  late TextEditingController barcode;
  late TextEditingController username;
  late TextEditingController age;
  late TextEditingController subscriptions;
  late TextEditingController deadline;
  late TextEditingController phone;
  late TextEditingController note;
  late TextEditingController search;

GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late AttendModel attendmodel;
  int supType = 0;
  bool isactive = false;
  List<AttendModel> attendList = [];

  final List<SubscriptionModel> _subList = [];
  List<String> subNameList = ["عام"];
  String subValue = "عام";

  @override
  void onInit() {
    barcode = TextEditingController();
    username = TextEditingController();
    age = TextEditingController();
    subscriptions = TextEditingController();
    deadline = TextEditingController();
    phone = TextEditingController();
    note = TextEditingController();
    search = TextEditingController();
    viewAll();
  //  getSub();
    super.onInit();
  }

  selectSupType(int i) {
    if (i != supType) {
     supType = i;
    update();
    }

  }

  selectActive(bool i) {
    isactive = i;
    update();
  }

  @override
  void addInvition() async{
     statusRequs = StatusRequst.loading;
      update();
      var res = await AttendData().addInvitation({
        "barcode": barcode.text,
        "adminID": "1",
      });
      if (res["msg"] == "subscription expired") {
        statusRequs = StatusRequst.failure;
        print("no");
      } else if (res["status"] == "success") {
        print("fukk");
        attendmodel =  AttendModel.fromJson(res["data"]);
          for (int i = 0; i < subNameList.length; i++) {
            if (attendmodel.subscriptionsName == subNameList[i]) {
              subValue = subNameList[i];
            }
          }
        statusRequs = StatusRequst.sucsess;
      } else if(res["msg"] == "invitition expired"){
        print("noooo");
        statusRequs = StatusRequst.failure;
    }
     update();
  }

  @override
  void addService()async {
      statusRequs = StatusRequst.loading;
      update();
      var res = await AttendData().addInvitation({
        "barcode": barcode.text,
        "adminID": "1",
      });
      if (res["msg"] == "subscription expired") {
        statusRequs = StatusRequst.failure;
        print("no");
      } else if (res["status"] == "success") {
        print("fukk");
        attendmodel =  AttendModel.fromJson(res["data"]);
          for (int i = 0; i < subNameList.length; i++) {
            if (attendmodel.subscriptionsName == subNameList[i]) {
              subValue = subNameList[i];
            }
          }
        statusRequs = StatusRequst.sucsess;
      } else if(res["msg"] == "service expired"){
        print("noooo");
        statusRequs = StatusRequst.failure;
    }
     update();
  }

  @override
  void addSession() async{
    //    statusRequs = StatusRequst.loading;
    //    if(barcode.text.isEmpty &&   ){
        
    //    }
    //   update();
    //   if()
    //   var res = await AttendData().addSessions({
    //     "barcode": barcode.text,
    //     "adminID": "1",
    //   });
    //   if (res["msg"] == "subscription expired") {
    //     statusRequs = StatusRequst.failure;
    //     print("no");
    //   } else if (res["status"] == "success") {
    //     print("fukk");
    //     attendmodel =  AttendModel.fromJson(res["data"]);
    //       for (int i = 0; i < subNameList.length; i++) {
    //         if (attendmodel.subscriptionsName == subNameList[i]) {
    //           subValue = subNameList[i];
    //         }
    //       }
    //     statusRequs = StatusRequst.sucsess;
    //   } else if(res["msg"] == "service expired"){
    //     print("noooo");
    //     statusRequs = StatusRequst.failure;
    // }
    //  update();
  }

  @override
  void addSub() async {
      statusRequs = StatusRequst.loading;
      update();
      var res = await AttendData().addSub({
        "barcode": barcode.text,
        "adminID": "1",
      });
      if (res["msg"] == "subscription expired") {
        statusRequs = StatusRequst.failure;
        print("no");
      } else if (res["status"] == "success") {
        print("fukk");
        attendmodel =  AttendModel.fromJson(res["data"]);
          for (int i = 0; i < subNameList.length; i++) {
            if (attendmodel.subscriptionsName == subNameList[i]) {
              subValue = subNameList[i];
            }
          }
        statusRequs = StatusRequst.sucsess;
      } else if(res["msg"] == "not subscription"){
        print("noooo");
        statusRequs = StatusRequst.failure;
    }
     update();

  }

  @override
  void assignModel(AttendModel privetModel) {
         username.text = privetModel.usersName!;
        phone.text = privetModel.usersPhone!;
        barcode.text = privetModel.barcode.toString() ;
        deadline.text = privetModel.renewalEnd.toString().substring(0,11) ;
        note.text = privetModel.usersNote! ;
        subValue = privetModel.subscriptionsName!;
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
      subValue = subNameList[2];

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

    var res = await AttendData().dailyView({
      "day": DateTime.now().toString().substring(0, 11),
    });
    if (res["status"] == "failure") {
      print("object");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      attendList = [];
      attendList.addAll(data.map((e) => AttendModel.fromJson(e)));

      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }
  
  @override
  void handlebarcode() {
     double? mid = double.tryParse(barcode.text);
    if (mid == null) {
      barcode.text = "";
    }
  }
  
  @override
  void handleFunctionsAdd() {
    if(supType == 0){

    }else if(supType == 1){

    }else if(supType == 2){

    }else{

    }
  }
  
  @override
  void rightSearch() async{
     statusRequs = StatusRequst.loading;
     String? search ;
      update();
      if(barcode.text.isNotEmpty || (username.text.isEmpty && barcode.text.isNotEmpty)){
        search = barcode.text ;
      }else if(username.text.isEmpty && barcode.text.isEmpty){
         
      }else{
         search = username.text ;
      }
      var res = await AttendData().usersSearch({
        "search": search,
      });
        if (res["status"] == "success") {
        print("fukk");
        attendmodel =  AttendModel.fromJson(res["data"]);
        print(attendmodel.attendanceBarcodeId);
          for (int i = 0; i < subNameList.length; i++) {
            if (attendmodel.subscriptionsName == subNameList[i]) {
              subValue = subNameList[i];
            }
          }
        
        username.text = attendmodel.usersName!;
        phone.text = attendmodel.usersPhone!;
        barcode.text = attendmodel.barcode.toString() ;
        deadline.text = attendmodel.renewalEnd.toString().substring(0,11) ;
        note.text = attendmodel.usersNote! ;
        subValue = attendmodel.subscriptionsName!;
        statusRequs = StatusRequst.sucsess;
      } else if(res["status"] == "failure"){
        print("noooo");
        statusRequs = StatusRequst.failure;
    }
     update();
  }
  
  @override
  void searchFun() async{
        statusRequs = StatusRequst.loading;
     update();
     var res = await AttendData().search(
      {
        "search": search.text
      }
     );
      if (res["status"] == "failure") {
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        List data = res["data"];
        attendList = [] ;
        attendList.addAll(data.map((e) => AttendModel.fromJson(e)));
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
      update();
  }
}
