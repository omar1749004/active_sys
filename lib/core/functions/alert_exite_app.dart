import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>alertExiteApp(){
   Get.defaultDialog(
    title :"Woring",
    middleText: "Do You Want Exit App", 
    actions: [
      ElevatedButton(
        onPressed: (){
        Get.back();
      }, child:const Text("cancel")),
       ElevatedButton(onPressed: (){
        exit(0);
      }, child:const Text("ok")),
    ]
  );
   return Future.value(true);
}