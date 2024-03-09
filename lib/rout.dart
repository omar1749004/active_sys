import 'package:active_system/features/attendance/attendance_view.dart';
import 'package:active_system/features/auth/view/screen/auth_view.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/middleware/mymiddleware.dart';
import 'package:active_system/features/create_pdf.dart';
import 'package:active_system/features/freeze/screen/freeze_screen.dart';
import 'package:active_system/features/home/view/screen/home.dart';
import 'package:active_system/features/manage_cost/manage_cost_view.dart';
import 'package:active_system/features/manage_players/manage_palyers.dart';
import 'package:active_system/features/manage_subscriptions/view/manage_subscriptions_view.dart';
import 'package:active_system/features/renew_subscriptions/renew_subscriptions_view.dart';
import 'package:active_system/features/safe/view/screen/safe_view.dart';
import 'package:active_system/features/trainers_ratio/trainers_ratio.dart';
import 'package:active_system/features/treasury_register/treasury_register_view.dart';
import 'package:active_system/features/users/view/screen/users_view.dart';
import 'package:active_system/features/trainers/trainers_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> route = [
  GetPage(
      name: AppRoute.authid,
      page: () => const AuthView(),
      middlewares: [MyMiddleWare()]),
  GetPage(
    name: AppRoute.homeid,
    page: () => const HomePage(),
  ),
  GetPage(
    name: AppRoute.managesubscriptionid,
    page: () => const ManageSubscriptionsView(),
  ),
  GetPage(
    name: AppRoute.trainerid,
    page: () => const TrainersView(),
  ),
  GetPage(
    name: AppRoute.usersid,
    page: () => const UsersView(),
  ),
  GetPage(
    name: AppRoute.renewSybscriptionsView,
    page: () => const RenewSybscriptionsView(),
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
    name: AppRoute.freezescreenid,
    page: () => const FreezeScreen(),
  ),
  GetPage(
    name: AppRoute.treasuryregisterid,
    page: () => const TreasuryRegisterView(),
  ),
  GetPage(
    name: AppRoute.managePlayers,
    page: () => const ManagePlayers(),
  ),
  GetPage(
    name: AppRoute.pdfId,
    page: () => const CreatePdf(),
  ),
  GetPage(
      name: AppRoute.trainersRatioView,
      page: () => const TrainersRatioView(),
      middlewares: [MyMiddleWare()]),
];
