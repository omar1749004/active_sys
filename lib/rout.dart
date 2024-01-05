import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/middleware/mymiddleware.dart';
import 'package:active_system/home/view/screen/home.dart';
import 'package:active_system/manage_subscriptions/view/manage_subscriptions_view.dart';
import 'package:active_system/renew_subscriptions/renew_subscriptions_view.dart';
import 'package:active_system/safe/view/screen/safe_view.dart';
import 'package:active_system/users/view/screen/users_view.dart';
import 'package:active_system/trainers/trainers_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> route = [
  GetPage(
      name: AppRoute.homeid,
      page: () => const HomePage(),
      middlewares: [MyMiddleWare()]),
  GetPage(
      name: AppRoute.Managesubscriptionid,
      page: () => ManageSubscriptionsView(),
      middlewares: [MyMiddleWare()]),
  GetPage(
      name: AppRoute.trainerid,
      page: () => TrainersView(),
      middlewares: [MyMiddleWare()]),
  GetPage(
      name: AppRoute.usersid,
      page: () => const UsersView(),
      middlewares: [MyMiddleWare()]),
  GetPage(
      name: AppRoute.RenewSybscriptionsView,
      page: () => RenewSybscriptionsView(),
      middlewares: [MyMiddleWare()]),
      GetPage(
      name: AppRoute.safeid,
      page: () =>const SafeView(),
      middlewares: [MyMiddleWare()]),
];
