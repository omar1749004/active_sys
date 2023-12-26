import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController username;
  late TextEditingController age;
  late TextEditingController subscriptions;
  late TextEditingController deadline;
  late TextEditingController phone;
  late TextEditingController note;
  late TextEditingController search;
  
  int supType = 4;
  bool isactive = false;
  selectSupType(int i) {
    if (i == supType) {
      supType = 4;
    } else {
      supType = i;
    }
    update();
  }

  selectActive(bool i) {
    isactive = i;
    update();
  }

  @override
  void onInit() {
    username =TextEditingController() ;
    age =TextEditingController() ;
    subscriptions =TextEditingController() ;
    deadline =TextEditingController() ;
    phone =TextEditingController() ;
    note =TextEditingController() ;
    search = TextEditingController() ;
    super.onInit();
  }
}
