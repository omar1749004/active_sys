import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/middleware/mymiddleware.dart';
import 'package:active_system/home/view/screen/home.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> route = [
  GetPage(name: AppRoute.homeid, page: ()=>const   HomePage() , middlewares: [MyMiddleWare()]),
  
];