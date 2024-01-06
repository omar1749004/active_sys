import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AuthController extends GetxController 
{
    IconData changeIcone();
  void showPassword();
}
class AuthControllerImp extends AuthController {
 //  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 late TextEditingController name;
  late TextEditingController password;

  bool isHidepass = true ;
  
  @override
  void onInit() {
     name = TextEditingController();
    password =TextEditingController();
    
    super.onInit();
  }
    @override
  showPassword() {
    isHidepass =!isHidepass;
    update();
  }
  
   @override
 IconData  changeIcone() {
    update();
    return isHidepass ?CupertinoIcons.eye_slash:CupertinoIcons.eye;
    
  }
}