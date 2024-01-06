import 'package:active_system/attendance/attendance_view.dart';
import 'package:active_system/auth/view/screen/auth_view.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/middleware/mymiddleware.dart';
import 'package:active_system/home/view/screen/home.dart';
import 'package:active_system/manage_cost/manage_cost_view.dart';
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
      ),
  GetPage(
      name: AppRoute.trainerid,
      page: () => TrainersView(),
      ),
  GetPage(
      name: AppRoute.usersid,
      page: () => const UsersView(),
      ),
  GetPage(
      name: AppRoute.RenewSybscriptionsView,
      page: () => RenewSybscriptionsView(),
      ),
  GetPage(
      name: AppRoute.safeid,
      page: () => const SafeView(),
      ),
  GetPage(
      name: AppRoute.managecostviewid,
      page: () => const ManageCostView(),
      ),
  GetPage(
      name: AppRoute.attendanceid,
      page: () => const AttendanceView(),
      ),
      GetPage(
      name: AppRoute.authid,
      page: () => const AuthView(),)
];
