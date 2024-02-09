import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles%20copy.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/safe/view/widget/custom_checkbox.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';

class ManagePlayersForm extends StatelessWidget {
  const ManagePlayersForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const Text(
                "إدارة الاعبين",
                textAlign: TextAlign.center,
                style: Styles.style25,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomDisplyMany(
                  textColor: ColorApp.thirdColor,
                  many: 1000,
                  text: "رقم العضوية"),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الكود",
                  validator: (val) {
                    return validInput(val!, 3, 50, "");
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الاسم",
                  validator: (val) {
                    return validInput(val!, 3, 50, "");
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomDateField(
                          width: 0, height: 40, iconSize: 16, fontSize: 15)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "تاريخ الميلاد",
                        style: Styles.style20,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "العمر",
                  validator: (val) {
                    return validInput(val!, 3, 50, "");
                  }),
              const SizedBox(
                height: 10,
              ),
              const CustomDropDownMenu(
                  label: "البائع",
                  items: ["الكل", "مخصص"],
                  intialValue: "مخصص"),
              const SizedBox(
                height: 10,
              ),
              const CustomDropDownMenu(
                  label: "المدرب",
                  items: ["الكل", "مخصص"],
                  intialValue: "مخصص"),
              const SizedBox(
                height: 10,
              ),
              const CustomDropDownMenu(
                  label: "الاشتراك",
                  items: ["الكل", "مخصص"],
                  intialValue: "مخصص"),
              const SizedBox(
                height: 10,
              ),
              const CustomDropDownMenu(
                  label: "المجموعه",
                  items: ["الكل", "مخصص"],
                  intialValue: "مخصص"),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child:
                        CustomCheckBox(ischeck: true, text: "تفعيل الاشتراك"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "قيمة الاشتراك",
                        mainTextColor: Colors.red,
                        validator: (val) {
                          return validInput(val!, 1, 50, "num");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "تليفون",
                  mainTextColor: Colors.red,
                  validator: (val) {
                    return validInput(val!, 1, 50, "num");
                  }),
              const SizedBox(
                height: 10,
              ),
              const CustomeTextFormAuth(
                hintText: "",
                lableText: "ملاحظات",
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 150,
                child: const Text(
                  "Camera here",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
