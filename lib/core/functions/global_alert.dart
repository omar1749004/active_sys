import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>globalAlert(String body,{String title ="تحذير"}){
   Get.defaultDialog(
    title :title,
    middleText: body, 
    actions: [
      ElevatedButton(
        onPressed: (){
        Get.back();
      }, child:const Text("ok")),
    ]
  );
   return Future.value(true);
}