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
  void editTransAction();
  void clearModel();
  void deleteTransAction();
}

class ExpensesControllerImp extends ExpensesController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime startSearch = DateTime.now();
  DateTime endSearch = DateTime.now();
  bool isdateSearch = true;
  double? totalExpenses = 0;
  bool canAdd = true;
  List<ExpensesModel> expensesList = [];
  List<List<String>> dataInTable = [];
  late ExpensesModel expensesModel;
  late TextEditingController reason;
  late TextEditingController amount;
  late TextEditingController note;
  late TextEditingController search;

  @override
  void onInit() async {
    reason = TextEditingController();
    amount = TextEditingController();
    note = TextEditingController();
    search = TextEditingController();
    amount.text = "0";
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;
    dateSearch(startSearch, endSearch);
    statusRequs = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 300));
    statusRequs = StatusRequst.failure;
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
        expensesList = [];
        assignDataInsideTable();
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
      expensesList = [];
      assignDataInsideTable();
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
          "note": note.text,
          "adminId": "1",
        },
      );
      if (res["status"] == "failure") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        handlTable(isdateSearch);
        statusRequs = StatusRequst.sucsess;
        clearModel();

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
      handlTable(isdateSearch);
    } else {
      _search();
    }
    update();
  }

  void _search() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await ExpensesData().search({
      "search": search.text,
      "start_date":
          isdateSearch == true ? startSearch.toString().substring(0, 11) : "0",
      "end_date": endSearch.toString().substring(0, 11),
    });
    if (res["status"] == "failure") {
      expensesList = [];
      assignDataInsideTable();
      totalExpenses = 0;
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      expensesList = [];
      expensesList.addAll(data.map((e) => ExpensesModel.fromJson(e)));
      totalExpenses = double.tryParse(res["moreInfo"][0]["totalExpenses"]);
      assignDataInsideTable();

      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

  @override
  void assignModel(ExpensesModel privetModel) {
    reason.text = privetModel.expensesReason ?? "";
    amount.text = privetModel.expensesValue.toString();
    note.text = privetModel.note.toString();
    expensesModel = privetModel;
    canAdd = false;
    update();
  }

//function to assign data inside List
  void assignDataInsideTable() {
    dataInTable = [];
    for (var i = 0; i < expensesList.length; i++) {
      dataInTable.add([
        expensesList[i].expensesId.toString(),
        expensesList[i].expensesValue.toString(),
        expensesList[i].expensesReason.toString(),
        "${expensesList[i].expensesDate!.hour}:${expensesList[i].expensesDate!.minute}      ${expensesList[i].expensesDate!.year}/${expensesList[i].expensesDate!.month}/${expensesList[i].expensesDate!.day}",
        expensesList[i].expensesAdminId.toString(),
      ]);
    }
  }

  @override
 void  editTransAction() async {
    if (formKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();

      var res = await ExpensesData().edit(
        {
          "id": expensesModel.expensesId.toString(),
          "reason": reason.text,
          "value": amount.text,
          "note": note.text,
          "adminId": "1",
        },
      );

      if (res["status"] == "failure") {
        globalAlert("لم يتم تعديل البيانات لأنها لم تتغير", title: "عذرًا");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        globalAlert("تم تعديل البانات بنجاح", title: "");
        statusRequs = StatusRequst.sucsess;
        clearModel();
        handlTable(isdateSearch);
      } else {
        statusRequs = StatusRequst.failure;
      }
      update();
    }
  }

  @override
 void clearModel() {
    reason.clear();
    note.clear();
    amount.clear();
    canAdd = true;
    update();
  }

  @override
  void deleteTransAction() async {
    var res = await ExpensesData().delete({
      "id": expensesModel.expensesId.toString(),
      "adminId" :"1" ,
    });

    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      expensesList.removeWhere(
          (element) => element.expensesId == expensesModel.expensesId);
          assignDataInsideTable();
          clearModel();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
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
