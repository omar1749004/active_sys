import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/data/models/freeze_mode.dart';
import 'package:active_system/data/models/renew_model.dart';
import 'package:active_system/data/models/sub_mode.dart';
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
  void calcfreezeDate();
  void selectRow(int assignSelect) ;
  void cleaModel();
}

class FreezeControllerImp extends FreezeController {
  StatusRequst statusRequs = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<FreezeModel> freezeList = [];
  late FreezeModel freezeModel;
  late RenewModel renewUser;
  late SubscriptionModel subModel;
  late TextEditingController day;
  late TextEditingController note;
  bool candelete = false ;
  int selectedIndex = -1;
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
  List<List<String>> dataInTable = [];
  
  MyServices myServices =Get.find();
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
    try{
     renewUser = Get.arguments["RenewModel"];
    subModel = Get.arguments["subModel"];
     getFreeze();
    name = renewUser.usersName;
    barcode = renewUser.barcode.toString();
    startrenew = renewUser.renewalStart.toString();
    endrenew = renewUser.renewalEnd.toString();
    subName = renewUser.subscriptionsName;
    days = subModel.subscriptionsDay.toString();
    }catch(e)
    {
      Future.delayed(Duration.zero, () {
        Get.offAndToNamed(AppRoute.renewSybscriptionsView);
      });
    }
    
   
  }

  @override
  void getFreeze() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await FrezzeData().view({
      "renewal_id": renewUser.renewalId.toString(),
      "subscriptions_id": subModel.subscriptionsId.toString(),
    });

    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["freeze"];
      frezzeDay = res["data"]["frezz_day"];
      freezeNum = res["data"]["frezz_number"];
      maxFreeze = res["data"]["max_frezz_day"];
      freezeList = [];
      freezeList.addAll(data.map((e) => FreezeModel.fromJson(e)));
      assignDataInsideTable();
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
            "adminId": myServices.sharedPreferences.getString("id"),
          },
        );

        if (res["msg"] == "unavilbe") {
          globalAlert("الاعب تخطى عدد مرات التجميد");
          statusRequs = StatusRequst.failure;
        } else if (res["status"] == "success") {
          day.text = "0" ;
          endrenew = 
          renewUser.renewalEnd!
          .add(Duration(days: int.parse(day.text)))
          .toString();
          getFreeze();
          note.clear();
          day.text = "0" ;
          statusRequs = StatusRequst.sucsess;
        }
      } else {
        statusRequs = StatusRequst.failure;
        update();
        globalAlert(msg);
      }
    }else{
      statusRequs = StatusRequst.failure;
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
  void calcfreezeDate() {
    int midDay = int.parse(day.text);
    endSearch = startSearch.add(Duration(days: midDay));
    update();
  }

  @override
  void assignModel(FreezeModel privetModel)async {
    freezeModel = privetModel;
    candelete = true ;
    
    update();
  }

  @override
  void deleteFreeze() async {

    var res = await FrezzeData().delete({
      "id": freezeModel.freezeId.toString(),
      "freeze_day": freezeModel.freezeDay.toString(),
      "renewal_end": renewUser.renewalEnd.toString().substring(0,11),
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
          getFreeze() ;
          assignDataInsideTable();
          note.clear();
          day.text = "0" ;
          candelete = false ;
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    selectedIndex  = -1 ;
    for (var i = 0; i < freezeList.length; i++) {
      dataInTable.add([
        freezeList[i].freezeId.toString(),
        freezeList[i].freezeDay.toString(),
        freezeList[i].freezeStart.toString().substring(0,11),
        freezeList[i].freezeEnd.toString().substring(0,11),
        freezeList[i].freezeUserId.toString(),
        freezeList[i].freezeRenewalId.toString(),
        freezeList[i].freezeNote.toString(),
      ]);
    }
  }
  @override
  cleaModel() {
    candelete = true;
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
