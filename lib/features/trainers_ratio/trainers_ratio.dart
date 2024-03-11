import 'package:active_system/controller/trainer_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/custom_button.dart';
import 'package:active_system/core/shared/custom_table_header.dart';
import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/features/auth/view/screen/auth_view.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/trainers_ratio/widgets/custom_search_for_trainers_ratio_view.dart';
import 'package:active_system/features/trainers_ratio/widgets/trainers_ratio_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainersRatioView extends StatelessWidget {
  const TrainersRatioView({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices services = Get.find();
    if (services.sharedPreferences.get("id") == "" &&
        services.sharedPreferences.get("name") == "") {
      return const AuthView();
    } else {
      Get.put(TrainersControllerImp());
      return Scaffold(
          body: GetBuilder<TrainersControllerImp>(builder: (controller) {
        // if (controller.firstState == StatusRequst.loading) {
        //   return const CustomLoadingIndecator();
        // } else {
        return Column(
          children: [
            //
            //AppBar
            //
            const CustomAppBar(),
            //
            //content in the middle
            //
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    //left menu
                    const CustomMenu(
                      pageName: 'ادارة المدربين',
                    ),
                    //
                    //the content in the middle
                    //
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //
                            //search bar
                            //
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: CustomTableHeader(
                                  searchController: controller.search,
                                  onChanged: (p0) {
                                    controller.checkSearch(p0);
                                  },
                                  header: "",
                                )),
                            CustomSearchDateInTrainersRatioView(
                                ontap: () {}, color: ColorApp.kPrimaryColor),
                            //
                            //table that contains data
                            //
                            Expanded(
                              flex: 6,
                              child: controller.statusRequs ==
                                      StatusRequst.loading
                                  ? const CustomLoadingIndecator()
                                  : Container(
                                      color: const Color.fromARGB(
                                          255, 218, 218, 218),
                                      child: CustomModernTable(
                                        data: controller.dataInTable,
                                        widths: const [
                                          150,
                                          150,
                                          250,
                                          200,
                                          250,
                                          250,
                                        ],
                                        header: const [
                                          "المسلسل",
                                          "الكود",
                                          "ألاسم",
                                          "نلفون",
                                          "عنوان",
                                          "ملاحظات",
                                        ],
                                        selectedIndex: controller.selectedIndex,
                                        nameOfGlobalID: 'trainersRatio',
                                        onRowTap: () {
                                          controller.assignModel(controller
                                                  .usersList[
                                              GlobalVariable.trainersRatio!]);
                                          controller.selectRow(
                                              GlobalVariable.trainersRatio!);
                                        },
                                        showDialog: () {},
                                      ),
                                    ),
                            ),
                            //
                            //buttons
                            //
                            Expanded(
                              flex: 1,
                              child: Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(
                                    text: "حذف الاعب",
                                    ontap: () {
                                      if (!controller.canAdd) {
                                        Get.defaultDialog(
                                            title: "تحذير ",
                                            middleText:
                                                "هل أنت متأكد أنك تريد حذف الاشتراك",
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    controller.deleteTrainer();
                                                  },
                                                  child: const Text("نعم")),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text("لا")),
                                            ]);
                                      }
                                    },
                                    isActive: !controller.canAdd ? true : false,
                                  ),
                                  CustomButton(
                                    text: "طباعه",
                                    ontap: () {},
                                  ),
                                  CustomButton(
                                    text: "إلغاء",
                                    ontap: () {
                                      controller.cleaModel();
                                    },
                                  ),
                                  CustomButton(
                                    text: "رجوع",
                                    ontap: () {
                                      Get.offNamed(AppRoute.trainerid);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //
                    //form input right screen
                    //
                    Expanded(
                      flex: 1,
                      child: controller.firstState == StatusRequst.loading
                          ? const CustomLoadingIndecator()
                          : Container(
                              height: MediaQuery.of(context).size.height,
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.186),
                                  ),
                                  left: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.186),
                                  ),
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 0.186),
                                  ),
                                ),
                              ),
                              child: const TrainersRatioForm(),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
        // }
      }));
    }
  }
}
