import 'package:active_system/controller/treasury_register_controller.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreasuryRegisterForm extends GetView<TreasuryRegisterControllerImp> {
  const TreasuryRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "سجل الخزنة",
            style: Styles.style23,
          ),
          const SizedBox(
            height: 10,
          ),
          //
          //start date button
          //
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomDateField(
                    width: 300,
                    height: 40,
                    iconSize: 18,
                    onChanged: (p0) {
                      controller.startSearch = p0!;
                      controller.dateSearch(
                          controller.startSearch, controller.endSearch);
                    },
                    fontSize: 15),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 170, 170, 170))),
                  child: const Text(
                    "من تاريخ",
                    style: TextStyle(
                        color: ColorApp.thirdColor,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          //
          //end date button
          //
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomDateField(
                    width: 300,
                    height: 40,
                    iconSize: 18,
                    onChanged: (p0) {
                      controller.endSearch = p0!;
                      controller.dateSearch(
                          controller.startSearch, controller.endSearch);
                    },
                    fontSize: 15),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 170, 170, 170))),
                  child: const Text(
                    "الى تاريخ",
                    style: TextStyle(
                        color: ColorApp.thirdColor,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropDownMenu(
            items: const ["مفصل بالبيانات", "غير مفصل بالبيانات"],
            intialValue: "مفصل بالبيانات",
            onChanged: (p0) {},
            label: "التقرير",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropDownMenu(
            items: const ["عام", "خاص"],
            intialValue: 'عام',
            onChanged: (p0) {},
            label: "النوع",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomeTextFormAuth(
            hintText: "",
            myController: controller.reason,
            onChanged: (p0) {
              controller.makeSearch();
            },
            lableText: "بحث (الوصف)",
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropDownMenu(
            items: const ["الكل", "خاص"],
            intialValue: 'الكل',
            onChanged: (p0) {},
            label: "الدفع",
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<TreasuryRegisterControllerImp>(
            builder: (controller) => CheckboxListTile(
              title: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "تجاهل البيانات والحذف",
                  style: Styles.style18B,
                ),
              ),
              value: controller.checkedValue,
              onChanged: (value) {
                controller.cnangeCheack(value!);
              },
            ),
          )
        ],
      ),
    );
  }
}
