import 'package:active_system/controller/auth_controller.dart';
import 'package:active_system/core/constant/app_route.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/image_asset.dart';
import 'package:active_system/core/constant/menu_items.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/services/services.dart';
import 'package:active_system/core/shared/custom_botton_copy.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices services = Get.find();
    Get.put(AuthControllerImp());
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
            color: ColorApp.kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 59, 59, 59)
                    .withOpacity(0.5), // Shadow color
                offset: const Offset(5, 5), // Offset from container
                blurRadius: 10, // Blur intensity
                spreadRadius: 5, // Spread of shadow
              ),
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 500,
        height: 600,
        child: GetBuilder<AuthControllerImp>(
          builder: (controller) => Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Image.asset(
                  ImageAsset.logo,
                  width: 200,
                  height: 200,
                ),
                Text(
                  "تسجيل الدخول",
                  style: Styles.style23,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الاسم",
                  validator: (val) {
                    return validInput(val!, 2, 20, "");
                  },
                  onfocuseColor: Colors.white,
                  lableStyle: Styles.style18,
                  myController: controller.name,
                  hintColor: Colors.white,
                  cursorColor: Colors.white,
                  mainTextColor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomeTextFormAuth(
                  hintText: "",
                  icone: controller.icone,
                  isShowIcone: true,
                  myController: controller.password,
                  ontap: () {
                    controller.showPassword();
                    controller.changeIcone();
                  },
                  lableText: "كلمة السر",
                  validator: (val) {
                    return validInput(val!, 4, 20, "");
                  },
                  onfocuseColor: Colors.white,
                  lableStyle: Styles.style18,
                  hintColor: Colors.white,
                  obscureText: controller.isHidepass,
                  mainTextColor: Colors.white,
                  cursorColor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomBotton1(
                      ontap: () async {
                        servicePowerName = [];
                        servicePowerRoutes = [];
                        //to add الصفحه الرئيسيه
                        servicePowerName.add(serviceName[0]);
                        servicePowerRoutes.add(serviceRoutes[0]);
                        //to add تسجيل الدخول
                        servicePowerName.add(serviceName.last);
                        servicePowerRoutes.add(serviceRoutes.last);
                        services.sharedPreferences.setStringList(
                            "servicePowerName", servicePowerName);
                        services.sharedPreferences.setStringList(
                            "servicePowerRoutes", servicePowerRoutes);
                        Get.offAllNamed(AppRoute.homeid);
                      },
                      text: "الغاء",
                      color: ColorApp.secondColor,
                      hieght: 50,
                    )),
                    Expanded(
                        child: CustomBotton1(
                      ontap: () {
                        controller.login();
                      },
                      text: "تسجيل",
                      color: ColorApp.secondColor,
                      hieght: 50,
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
