import 'package:active_system/features/attendance/attendance_view.dart';
import 'package:active_system/features/auth/view/screen/auth_view.dart';
import 'package:active_system/features/home/view/screen/home.dart';
import 'package:active_system/features/manage_cost/manage_cost_view.dart';
import 'package:active_system/features/manage_players/manage_palyers.dart';
import 'package:active_system/features/manage_subscriptions/view/manage_subscriptions_view.dart';
import 'package:active_system/features/players_profile/players_profile_view.dart';
import 'package:active_system/features/renew_subscriptions/renew_subscriptions_view.dart';
import 'package:active_system/features/safe/view/screen/safe_view.dart';
import 'package:active_system/features/trainers/trainers_view.dart';
import 'package:active_system/features/users/view/screen/users_view.dart';
import 'package:flutter/cupertino.dart';

const List<String> serviceName = [
  "الصفحة الرئيسية",
  "سجل الحضور",
  "ادارة الاشتراكات",
  "تجديد الاشتراكات",
  "ادارة المتدربين",
  "ادارة المستخدمين",
  "الخزنة",
  "ادارة المصروفات",
  "الملف الشخصى للاعبين",
  "تسجيل الدخول",
  "سجل الخزنة",
  "ادارة الاعبين"
];

const List<String> serviceRoutes = [
  '/',
  "AttendanceView",
  'ManageSubscriptionsView',
  "RenewSybscriptionsView",
  "TrainersView",
  "usersid",
  "safeciew",
  "ManageCostView",
  "PlayersProfileView",
  "authid",
  "TreasuryRegisterView",
  "ManagePlayers"
];
const List<Widget> serviceWidget = [
  HomePage(),
  AttendanceView(),
  ManageSubscriptionsView(),
  RenewSybscriptionsView(),
  TrainersView(),
  UsersView(),
  SafeView(),
  ManageCostView(),
  PlayersProfileView(),
  AuthView(),
  TrainersView(),
  ManagePlayers()
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
