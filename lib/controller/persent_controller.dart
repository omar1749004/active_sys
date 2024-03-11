import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/data/models/persent_model.dart';
import 'package:active_system/data/models/user_model.dart';
import 'package:active_system/data/service/remote/trainer_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PersentController extends GetxController {
  
  void initialData();
  void dateSearch() ;
  void getpdf() ;
}

class PersentControllerImp extends PersentController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<TrainerNumberModel> phonesList = [];

  List<PercentModel> persentList = [];

  UserModel? usermodel ;
  String ?  name = "";
  String ? phone  ="";
  bool candelete = false ;

  int selectedIndex = -1;
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();
  int? totalClients = 0;
  double? totalSalary = 0;

  List<List<String>> dataInTable = [];
  
  MyServices myServices =Get.find();
  @override
  void onInit() {
     initialData();
    super.onInit();
  }

  @override
  void initialData() async {
    try{
    usermodel = Get.arguments["usermodel"];
    startSearch =  endSearch.subtract(const Duration(days: 30));
    //
     dateSearch();//
     //
    name = usermodel!.usersName;
    phone = usermodel!.usersPhone;
    
    firstState = StatusRequst.loading;  
    await Future.delayed(const Duration(milliseconds: 300));
    firstState = StatusRequst.failure;
    update();
    }catch(e)
    {
      Future.delayed(Duration.zero, () {
        Get.offAndToNamed(AppRoute.trainerid);
      });
    }
    
   
  }

  @override
  void dateSearch() async {
    statusRequs = StatusRequst.loading;
    update();
      var res = await TrainerData().dateSearch({
        "start_date": startSearch.toString().substring(0, 11),
        "end_date": endSearch.toString().substring(0, 11),
        "captianId" : usermodel!.usersId.toString() ,
      });
      if (res["status"] == "failure") {
        totalClients = 0;
        totalSalary = 0 ;
        persentList = [];
        assignDataInsideTable();
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        List data = res["data"];
        totalClients = res["moreInfo"][0]["totalClient"];
        totalSalary = double.tryParse(res["moreInfo"][0]["totalSalary"]);
        persentList = [];
        persentList.addAll(data.map((e) => PercentModel.fromJson(e)));
        assignDataInsideTable();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    update();
  }

  
  //function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < persentList.length; i++) {
      dataInTable.add([
         persentList[i].percentageTrainerPercent.toString(),
         persentList[i].percentageTrainerAmount.toString(),
        persentList[i].usersName.toString(),
        persentList[i].subscriptionsName.toString(),
        persentList[i].renewalStart.toString(),
        persentList[i].renewalEnd.toString(),
        
      ]);
    }
  }
     @override
  void getpdf() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await TrainerData().getpdf({
      "start_date": startSearch.toString().substring(0, 11),
      "end_date": endSearch.toString().substring(0, 11),
      "captianId" : usermodel!.usersId.toString() ,
    });

    Get.offAndToNamed(AppRoute.pdfId, arguments: {"pdf": res["data"]});
   statusRequs = StatusRequst.failure;
    update();
  }
}
