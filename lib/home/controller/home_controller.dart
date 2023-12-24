import 'package:get/get.dart';

class HomeController extends GetxController{
  int supType = 4;
  bool isactive = false ;
  selectSupType (int i){
    if(i == supType)
    {
      supType = 4 ;
    }else{
      supType = i ;
    }
    update();
  }
  selectActive(bool i){
     isactive = i ;
     update();
  }
  @override
  void onInit() {
    
    super.onInit();
  }
}