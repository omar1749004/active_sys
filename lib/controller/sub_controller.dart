import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/functions/global_alert.dart';
import 'package:active_system/data/models/sub_mode.dart';
import 'package:active_system/data/service/remote/sub_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class MangeSubController extends GetxController {
  void handlePrice();
  void handleFrezzDay();
  void handleDay();
  void handleSessionsNumber();
  void handleFrezzNumber();
  void handleMaxFrezzDay();
  void handleInvitationsNumber();
  void handleMaxInvitation();
  void handleServiceNumber();
  void handleMaxService();
  void handleAllowedNumber();
  void addSub();
  void viewAll();
  void assignModel(SubscriptionModel privetModel);
  void deleteSub();
  void checkSearch(String val);
  void editSub();
  void cleaModel();
}

class MangeSubControllerImp extends MangeSubController {
  StatusRequst statusRequs = StatusRequst.non;
  StatusRequst firstState = StatusRequst.non;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<SubscriptionModel> subList = [];
  List<List<String>> dataInTable = [];
  late SubscriptionModel submodel;
  String type = "اشتراك";
  bool canAdd =true ;

  late TextEditingController name;
  late TextEditingController specialization;
  late TextEditingController price;
  late TextEditingController day;
  late TextEditingController sessionsNumber;
  late TextEditingController frezzDay;
  late TextEditingController frezzNumber;
  late TextEditingController maxFrezzDay;
  late TextEditingController invitationsNumber;
  late TextEditingController maxInvitation;
  late TextEditingController serviceNumber;
  late TextEditingController maxService;
  late TextEditingController allowedNumber;
  late TextEditingController notes;
  late TextEditingController search;

  @override
  void onInit() async {
    name = TextEditingController();
    specialization = TextEditingController();
    price = TextEditingController();
    day = TextEditingController();
    sessionsNumber = TextEditingController();
    frezzDay = TextEditingController();
    frezzNumber = TextEditingController();
    maxFrezzDay = TextEditingController();
    invitationsNumber = TextEditingController();
    maxInvitation = TextEditingController();
    serviceNumber = TextEditingController();
    maxService = TextEditingController();
    allowedNumber = TextEditingController();
    notes = TextEditingController();
    search = TextEditingController();

    cleaModel();
    firstState = StatusRequst.loading;
    await Future.delayed(const Duration(milliseconds: 100));
    firstState = StatusRequst.failure;
    update();
    viewAll();

    super.onInit();
  }
  @override
  void addSub() async {
    if (formKey.currentState!.validate()) {
      statusRequs = StatusRequst.loading;
      update();
      var res = await SubData().add(
        {
          "name": name.text,
          "type": type == "حصة" ? "1":"0",
          "specialization": "0",
          "price": price.text,
          "day": day.text,
          "sessions_number": sessionsNumber.text,
          "frezz_day": frezzDay.text,
          "frezz_number": frezzNumber.text,
          "max_frezz_day": maxFrezzDay.text,
          "invitations_number": invitationsNumber.text,
          "max_invitation": maxInvitation.text,
          "service_number": serviceNumber.text,
          "max_service": maxService.text,
          "allowed_number": allowedNumber.text,
          "notes": notes.text,
        },
      );
      if (res["status"] == "failure") {
        globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }
    }
    update();
  }

  @override
  void assignModel(SubscriptionModel privetModel) {
    name.text = privetModel.subscriptionsName;
    price.text = privetModel.subscriptionsPrice.toString();
    day.text = privetModel.subscriptionsDay.toString();
    sessionsNumber.text = privetModel.subscriptionsSessionsNumber.toString();
    frezzDay.text = privetModel.subscriptionsFrezzDay.toString();
    frezzNumber.text = privetModel.subscriptionsFrezzNumber.toString();
    maxFrezzDay.text = privetModel.subscriptionsMaxFrezzDay.toString();
    invitationsNumber.text =
        privetModel.subscriptionsInvitationsNumber.toString();
    maxInvitation.text = privetModel.subscriptionsMaxInvitation.toString();
    serviceNumber.text = privetModel.subscriptionsServiceNumber.toString();
    maxService.text = privetModel.subscriptionsMaxService.toString();
    allowedNumber.text = privetModel.subscriptionsAllowedNumber.toString();
    notes.text = privetModel.subscriptionsNotes.toString();
    submodel = privetModel;
    type = privetModel.subscriptionsType.toString() == "0" ? "اشتراك" :"حصة";
    canAdd =false ;
    update();
  }

  @override
  void viewAll() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await SubData().view();
    if (res["status"] == "failure") {
      subList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      subList = [];
      subList.addAll(data.map((e) => SubscriptionModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    await Future.delayed(const Duration(milliseconds: 300));
    update();
  }

  @override
  void handleAllowedNumber() {
    int? mid = int.tryParse(allowedNumber.text);
    if (mid == null) {
      allowedNumber.text = "0";
    }
  }

  @override
  void handleDay() {
    int? mid = int.tryParse(day.text);
    if (mid == null) {
      day.text = "0";
    }
  }

  @override
  void handleFrezzDay() {
    int? mid = int.tryParse(frezzDay.text);
    if (mid == null) {
      frezzDay.text = "0";
    }
  }

  @override
  void handleFrezzNumber() {
    int? mid = int.tryParse(frezzNumber.text);
    if (mid == null) {
      frezzNumber.text = "0";
    }
  }

  @override
  void handleInvitationsNumber() {
    int? mid = int.tryParse(invitationsNumber.text);
    if (mid == null) {
      invitationsNumber.text = "0";
    }
  }

  @override
  void handleMaxFrezzDay() {
    int? mid = int.tryParse(maxFrezzDay.text);
    if (mid == null) {
      maxFrezzDay.text = "0";
    }
  }

  @override
  void handleMaxInvitation() {
    int? mid = int.tryParse(maxInvitation.text);
    if (mid == null) {
      maxInvitation.text = "0";
    }
  }

  @override
  void handleMaxService() {
    int? mid = int.tryParse(maxService.text);
    if (mid == null) {
      maxService.text = "0";
    }
  }

  @override
  void handlePrice() {
    double? mid = double.tryParse(price.text);
    if (mid == null) {
      price.text = "0";
    }
  }

  @override
  void handleServiceNumber() {
    double? mid = double.tryParse(serviceNumber.text);
    if (mid == null) {
      serviceNumber.text = "0";
    }
  }

  @override
  void handleSessionsNumber() {
    double? mid = double.tryParse(sessionsNumber.text);
    if (mid == null) {
      sessionsNumber.text = "0";
    }
  }

  @override
  void deleteSub() async {
    var res = await SubData().delete({
      "id": submodel.subscriptionsId.toString(),
    });

    if (res["status"] == "failure") {
      globalAlert("يرجى إعادة المحاولة في وقت لاحق", title: "!خطأ");
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      subList.removeWhere(
          (element) => element.subscriptionsId == submodel.subscriptionsId);
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
    for (var i = 0; i < subList.length; i++) {
      dataInTable.add([
        subList[i].subscriptionsId.toString(),
        subList[i].subscriptionsName,
        subList[i].subscriptionsPrice.toString(),
        subList[i].subscriptionsType.toString(),
        subList[i].subscriptionsDay.toString(),
      ]);
    }
  }

  @override
  void editSub() async {
    statusRequs = StatusRequst.loading;
    update();
    if (formKey.currentState!.validate()) {
      var res = await SubData().edit({
        "id": submodel.subscriptionsId.toString(),
        "name": name.text,
        "type": type,
        "specialization": "0",
        "price": price.text,
        "day": day.text,
        "sessions_number": sessionsNumber.text,
        "frezz_day": frezzDay.text,
        "frezz_number": frezzNumber.text,
        "max_frezz_day": maxFrezzDay.text,
        "invitations_number": invitationsNumber.text,
        "max_invitation": maxInvitation.text,
        "service_number": serviceNumber.text,
        "max_service": maxService.text,
        "allowed_number": allowedNumber.text,
        "notes": notes.text,
      });
      if (res["status"] == "failure") {
        globalAlert("لم يتم تعديل البيانات لأنها لم تتغير", title: "عذرًا");
        statusRequs = StatusRequst.failure;
      } else if (res["status"] == "success") {
        globalAlert("تم تعديل البانات بنجاح", title: "");
        cleaModel();
        statusRequs = StatusRequst.sucsess;
      } else {
        statusRequs = StatusRequst.failure;
      }

      update();
    }
  }
  @override
  void cleaModel() {
    name.clear();
    specialization.text = "عام";
    price.text = "0";
    day.text = "0";
    sessionsNumber.text = "0";
    frezzDay.text = "0";
    frezzNumber.text = "0";
    maxFrezzDay.text = "0";
    invitationsNumber.text = "0";
    maxInvitation.text = "0";
    serviceNumber.text = "0";
    maxService.text = "0";
    allowedNumber.text = "0";
    canAdd = true ;
    update();
  }

  @override
  void checkSearch(String val) {
    if (val.isEmpty) {
      viewAll();
    } else {
      _search();
    }
    update();
  }

  void _search() async {
    statusRequs = StatusRequst.loading;
    update();
    var res = await SubData().search({"search": search.text});

    if (res["status"] == "failure") {
      subList = [];
      assignDataInsideTable();
      statusRequs = StatusRequst.failure;
    } else if (res["status"] == "success") {
      List data = res["data"];
      subList = [];
      subList.addAll(data.map((e) => SubscriptionModel.fromJson(e)));
      assignDataInsideTable();
      statusRequs = StatusRequst.sucsess;
    } else {
      statusRequs = StatusRequst.failure;
    }
    update();
  }

}
// void a() async {
//   var res = await SubData().view();
//   print(res.toString());
// }

// var res = await SubData().add(
//   {
//     "name": text,
//     "type": type,
//     "specialization": ,
//     "price": note,
//     "day": powers,
//     "sessions_number": text,
//     "frezz_day": type,
//     "frezz_number": sha1(password.text),
//     "max_frezz_day": note,
//     "invitations_number": powers,
//     "max_invitation": text,
//     "service_number": type,
//     "max_service": sha1(password.text),
//     "allowed_number": note,
//     "notes": powers,
//   },
// );

// var res = await SubData().edit(
//   {
//    "id": id,
//     "name": text,
//     "type": type,
//     "specialization": ,
//     "price": note,
//     "day": powers,
//     "sessions_number": text,
//     "frezz_day": type,
//     "frezz_number": sha1(password.text),
//     "max_frezz_day": note,
//     "invitations_number": powers,
//     "max_invitation": text,
//     "service_number": type,
//     "max_service": sha1(password.text),
//     "allowed_number": note,
//     "notes": powers,
//   }

// );
// var res = await SubData().delete(
//   {
//    "id": id
//   }
  
// );
