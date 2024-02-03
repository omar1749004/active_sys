import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class UsersController extends GetxController{

}
class UsersControllerImp extends UsersController{
  late TextEditingController search;





  @override
  void onInit() {
   search =TextEditingController() ;
    super.onInit();
  }
}