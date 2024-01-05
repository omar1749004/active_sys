import 'package:active_system/core/localization/change_lacal.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/rout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() async{
  runApp(const MyApp());
  await intialService();
   
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller =Get.put(LocalController()) ;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: controller.apptheme,
      locale: controller.language,
      supportedLocales:const [
         Locale('en', ''), // English
         Locale('ar', 'SA'), // Arabic
      ],
      getPages: route,
    ) ;
  }
}

