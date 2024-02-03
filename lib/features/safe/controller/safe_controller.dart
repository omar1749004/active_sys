import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SafeController extends GetxController{

}
class SafeControllerImp extends SafeController{
 late  TextEditingController search ;


 @override
  void onInit() {
    search =TextEditingController() ;
    super.onInit();
  }
}