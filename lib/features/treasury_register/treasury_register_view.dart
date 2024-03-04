import 'package:active_system/controller/treasury_register_controller.dart';
import 'package:active_system/core/class/statuscode.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/custom_modern_table.dart';
import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/core/shared/loading_indecator.dart';
import 'package:active_system/core/shared/custom_button.dart';
import 'package:active_system/features/manage_subscriptions/view/widgets/custom_menu.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:active_system/features/treasury_register/widgets/treasury_register_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreasuryRegisterView extends StatelessWidget {
  const TreasuryRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TreasuryRegisterControllerImp());
    return Scaffold(
        body: GetBuilder<TreasuryRegisterControllerImp>(builder: (controller) {
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
                    //
                    //left menu
                    //
                    const CustomMenu(
                      pageName: 'سجل الخزنة',
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
                            //table that contains data
                            //
                            Expanded(
                              flex: 11,
                              child:
                                  controller.statusRequs == StatusRequst.loading
                                      ? const CustomLoadingIndecator()
                                      : Container(
                                          color: const Color.fromARGB(
                                              255, 218, 218, 218),
                                          child: CustomModernTable(
                                            data: controller.dataInTable,
                                            widths: const [
                                              150,
                                              250,
                                              200,
                                              150,
                                              150,
                                              150,
                                              150,
                                              200,
                                              150,
                                              200,
                                              200
                                            ],
                                            header: const [
                                              "رقم التسلسل",
                                              "وصف",
                                              "التاريخ",
                                              "الوارد",
                                              "الصادر",
                                              "المتبقى",
                                              "النوع",
                                              "المستخدم",
                                              "كود المستخدم",
                                              "مجموع الواردات",
                                              "مجموع الصادرات",
                                            ],
                                            nameOfGlobalID: 'treasuryRegister',
                                            onRowTap: () {},
                                            showDialog: () {},
                                          ),
                                        ),
                            ),
                            //
                            //data of table
                            //
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: CustomDisplyMany(
                                          textColor: ColorApp.thirdColor,
                                          many: controller.toralSafe.toString(),
                                          text: "الصافى"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: CustomDisplyMany(
                                          textColor: ColorApp.thirdColor,
                                          many: controller.toralOutcoming
                                              .toString(),
                                          text: "الصادر"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: CustomDisplyMany(
                                          textColor: ColorApp.thirdColor,
                                          many: controller.toralIncoming
                                              .toString(),
                                          text: "الوارد"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //
                            //buttons
                            //
                            Expanded(
                              flex: 1,
                              child: Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  CustomButton(
                                    text: "طباعة",
                                    ontap: () {
                                      controller.getpdf();
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
                      child:
                      controller.firstState == StatusRequst.loading ?const CustomLoadingIndecator():
                       Container(
                        width: 300,
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
                        child: const TreasuryRegisterForm(),
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
