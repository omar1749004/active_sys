import 'package:active_system/core/services/services.dart';
import 'package:active_system/features/attendance/attendance_view.dart';
import 'package:active_system/features/auth/view/screen/auth_view.dart';
import 'package:active_system/features/home/view/screen/home.dart';
import 'package:active_system/features/manage_cost/manage_cost_view.dart';
import 'package:active_system/features/manage_players/manage_palyers.dart';
import 'package:active_system/features/manage_subscriptions/view/manage_subscriptions_view.dart';
import 'package:active_system/features/renew_subscriptions/renew_subscriptions_view.dart';
import 'package:active_system/features/safe/view/screen/safe_view.dart';
import 'package:active_system/features/trainers/trainers_view.dart';
import 'package:active_system/features/treasury_register/treasury_register_view.dart';
import 'package:active_system/features/users/view/screen/users_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

MyServices services = Get.find();
const List<String> serviceName = [
  "الصفحة الرئيسية",
  "سجل الحضور",
  "ادارة الاشتراكات",
  'تجديد الاشتراكات',
  'ادارة المدربين',
  "ادارة المستخدمين",
  "ادارة الاعبين",
  "ادارة المصروفات",
  "الخزنة",
  "سجل الخزنة",
  "تسجيل خروج",
];

const List<String> serviceRoutes = [
  'home',
  "AttendanceView",
  'ManageSubscriptionsView',
  "RenewSybscriptionsView",
  "TrainersView",
  "usersid",
  "ManagePlayers",
  "ManageCostView",
  "safeciew",
  "TreasuryRegisterView",
  "/",
];
const List<Widget> serviceWidget = [
  HomePage(),
  AttendanceView(),
  ManageSubscriptionsView(),
  RenewSybscriptionsView(),
  TrainersView(),
  UsersView(),
  ManagePlayers(),
  ManageCostView(),
  SafeView(),
  TreasuryRegisterView(),
  AuthView(),
];
// final List<Widget Function()> serviceWidgetBuilders = [
//   () => HomePage(),
//   () => AttendanceView(),
//   () => ManageSubscriptionsView(),
//   () => RenewSybscriptionsView(),
//   () => TrainersView(),
//   () => UsersView(),
//   () => SafeView(),
//   () => ManageCostView(),
//   () => PlayersProfileView(),
//   () => AuthView(),
//   () => TrainersView(),
//   () => ManagePlayers(),
// ];

//section specific for powers of admin to create list of pages that will show him

//List of boolean, every index point to page and every value point to if page from his power or not (true -> from his power , false -> not from his power)

List<bool> booleansPowers = [];

//final result from his power
List<String> servicePowerName =
    services.sharedPreferences.getStringList("servicePowerName") ?? [];

//final result from his power
List<String> servicePowerRoutes =
    services.sharedPreferences.getStringList("servicePowerRoutes") ?? [];
