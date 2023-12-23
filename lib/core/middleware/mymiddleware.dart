import 'package:active_system/core/constant/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find(); //علشان عاملين  put
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homeid);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.homeid);
    } else
      {
        return null;
      }
  }
}
