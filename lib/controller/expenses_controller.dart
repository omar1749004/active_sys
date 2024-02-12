import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/data/models/expenses_model.dart';
import 'package:active_system/data/service/remote/expenses_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ExpensesController extends GetxController {
  void dateSearch(DateTime startD, DateTime endD);
  void viewAll();
  void handlTable(bool isdate);
  void checkSearch(String val);
  void handleprice();
  void addTrandsAction();
  void assignModel(ExpensesModel privetModel);
}

class ExpensesControllerImp extends ExpensesController {
  StatusRequst statusRequs = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();
  bool isdateSearch = true;
  double? totalExpenses = 0;

  List<ExpensesModel> expensesList = [];
  List<List<String>> dataInTable = [];
  late ExpensesModel expensesModel;
  late TextEditingController reason;
  late TextEditingController amount;
  late TextEditingController note;
  late TextEditingController search;

  @override
  void onInit() {
    reason = TextEditingController();
    amount = TextEditingController();
    note = TextEditingController();
    search = TextEditingController();
    amount.text = "0";
    dateSearch(startSearch, endSearch);
    viewAll();
    super.onInit();
  }

  @override
  void dateSearch(DateTime startD, DateTime endD) async {
    statusRequs = StatusRequst.loading;
    update();
    if (isdateSearch) {
      var res = await ExpensesData().dateSearch({
        "start_date": startD.toString().substring(0, 11),
        "end_date": endD.toString().substring(0, 11),
      });
      if (res["status"] == "failure") {
        totalExpenses = 0;
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        List data = res["data"];
        totalExpenses = double.tryParse(res["moreInfo"][0]["totalExpenses"]);
        expensesList = [];
        expensesList.addAll(data.map((e) => ExpensesModel.fromJson(e)));
        assignDataInsideTable();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  void viewAll() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await ExpensesData().view();
    if (res["status"] == "failure") {
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];

      totalExpenses = double.tryParse(res["moreInfo"][0]["totalExpenses"]);
      expensesList = [];
      expensesList.addAll(data.map((e) => ExpensesModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void handlTable(bool isdate) {
    if (isdateSearch) {
      dateSearch(startSearch, endSearch);
    } else {
      viewAll();
    }
    update();
  }

  @override
  void handleprice() {
    int? mid = int.tryParse(amount.text);
    if (mid == null) {
      amount.text = "0";
    }
  }

  @override
  void addTrandsAction() async {
    if (formKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();
      var res = await ExpensesData().add(
        {
          "reason": reason.text,
          "value": amount.text,
          "adminId": "1",
        },
      );
      if (res["status"] == "failure") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق",title: "!خطأ");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        handlTable(isdateSearch);
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
      statusRequs = StatusRequst.non;
    } else {
      _search();
    }
    update();
  }

  void _search() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await ExpensesData().search({"search": search.text});
    if (res["status"] == "failure") {
      print("no");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      print(data);
      expensesList = [];
      expensesList.addAll(data.map((e) => ExpensesModel.fromJson(e)));

      assignDataInsideTable();

      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void assignModel(ExpensesModel privetModel) {
    reason.text = privetModel.expensesReason ?? "" ;
    amount.text = privetModel.expensesValue.toString() ;
    expensesModel = privetModel ;
  }

//function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < expensesList.length; i++) {
      dataInTable.add([
        expensesList[i].expensesId.toString(),
        expensesList[i].expensesValue.toString(),
        expensesList[i].expensesReason.toString(),
        expensesList[i].expensesDate.toString(),
      ]);
    }
  }
  
}

// import 'package:active_system/data/service/remote/expenses_data.dart';

// var res = await ExpensesData().add(
//   {
//     "reason": text,
//     "value":  text,
//     "adminId": ,
//   },
// );

// var res = await ExpensesData().edit(
//   {
//     "id": ,
//     "reason": text,
//     "value":  text,
//     "adminId": ,
//   },
// );
// var res = await ExpensesData().delete(
//   {
//    "id": id
//   }

// );

// var res = await ExpensesData().dateSearch(
//   {
//    "start_date": id,
//    "end_date": id,
//   }

// );
// var res = await ExpensesData().search(
//   {
//    "search": id,
//   }

// );
