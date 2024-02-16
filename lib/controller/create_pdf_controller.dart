
import 'package:get/get.dart';

class PdfController extends GetxController {

String? pdf  ;


  @override
  void onInit() {
    try{
     pdf = Get.arguments["pdf"];
     print(pdf);
    }
    catch(e){
      Get.back();
    }
    
    super.onInit();
  }
}


