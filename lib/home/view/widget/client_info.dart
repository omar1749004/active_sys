import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClinetInfo extends GetView<HomeController> {
  const ClinetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     CupertinoIcons.antenna_radiowaves_left_right,
                //     color: ColorApp.kPrimaryColor,
                //     size: MediaQuery.of(context).size.width * 0.04,
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30),
                  child: CircleAvatar(
                    backgroundColor: ColorApp.gray,
                    radius: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          minWidth: 180,
                          color: ColorApp.secondColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onPressed: () {},
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          minWidth: 180,
                            padding: const EdgeInsets.symmetric(
                                 vertical: 20),
                            color: ColorApp.secondColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            onPressed: () {},
                            child: const Text(
                              "حضور",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                             const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 120,
                          child: CustomeTextFormAuth(
                            fontSize: 35,
                              hintText: "",
                              lableText: "الكود",
                              myController: controller.username,
                              isPhoneNumber: true,
                              validator: (val) {
                                return validInput(val!, 5, 50, "username");
                              }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "الاسم",
                myController: controller.username,
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
            const SizedBox(
              height: 15,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "العمر",
                myController: controller.age,
                validator: (val) {
                  return validInput(val!, 1, 5, "num");
                }),
            const SizedBox(
              height: 15,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "الاشتراك",
                myController: controller.subscriptions,
                validator: (val) {
                  return validInput(val!, 0, 50, "");
                }),
            const SizedBox(
              height: 15,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "انتهاء",
                myController: controller.deadline,
                validator: (val) {
                  return validInput(val!, 0, 50, "");
                }),
            const SizedBox(
              height: 15,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "الهاتف",
                myController: controller.phone,
                validator: (val) {
                  return validInput(val!, 5, 11, "phone");
                }),
            const SizedBox(
              height: 15,
            ),
            CustomeTextFormAuth(
                hintText: "",
                lableText: "ملاحظات",
                myController: controller.note,
                validator: (val) {
                  return validInput(val!, 0, 50, "");
                }),
          ],
        ),
      ),
    );
  }
}
