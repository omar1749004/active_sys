import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/middleware/mymiddleware.dart';
import 'package:active_system/home/view/screen/home.dart';
import 'package:active_system/subscriptions/view/subscriptions_view.dart';
import 'package:active_system/users/view/screen/users_view.dart';
import 'package:active_system/trainers/trainers_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> route = [
  GetPage(
      name: AppRoute.homeid,
      page: () => const HomePage(),
      middlewares: [MyMiddleWare()]),
  GetPage(
      name: AppRoute.subscriptionid,
      page: () => SubscriptionsView(),
      middlewares: [MyMiddleWare()]),
  GetPage(
      name: AppRoute.trainerid,
      page: () => TrainersView(),
      middlewares: [MyMiddleWare()]),
      GetPage(
      name: AppRoute.usersid,
      page: () => const UsersView(),
      middlewares: [MyMiddleWare()]),
];
