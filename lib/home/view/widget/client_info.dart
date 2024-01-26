import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/home/controller/home_controller.dart';
import 'package:active_system/home/data/service/static/note_knoladge.dart';
import 'package:active_system/home/data/service/static/sup_type.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ...List.generate(
                    4,
                    (index) => Expanded(
                      child: CustomBotton1(
                       marginTop: 10,
                        marginBottom: 25,
                        hieght: 50,
                        ontap: () {
                          controller.selectSupType(index);
                          
                        },
                        text: supType[index],
                        color: controller.supType == index
                            ? ColorApp.onfoucosColor
                            : ColorApp.kPrimaryColor,
                      ),
                    ),
                  ),
              ],
            ),
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
                  padding: const EdgeInsets.only( bottom: 30, left: 30),
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
                const SizedBox(
              height: 15,
            ),
                 CustomDropDownMenu(
                  redius: 30,
                      items: items,
                      label: "اشتراك",
                      intialValue: selectedItem,
                      onChanged: (val) {},
                    ),
                    
          ],
        ),
      ),
    );
  }
}
