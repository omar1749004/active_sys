import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';

class RenewSubscriptionForm extends StatelessWidget {
  const RenewSubscriptionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: CustomBotton1(
                        hieght: 40,
                        text: "بحث",
                        ontap: () {},
                        color: ColorApp.kPrimaryColor,
                        marginBottom: 0,
                        marginLeft: 0,
                        marginRight: 0,
                        marginTop: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomeTextFormAuth(
                          hintText: "",
                          lableText: "الكود",
                          validator: (val) {
                            return validInput(val!, 5, 50, "username");
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //
              //here the text field that will shown number of renew
              //
              const CustomDisplyMany(
                many: 101,
                text: "رقم التسلسل",
                textColor: ColorApp.thirdColor,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "اسم اللاعب",
                  validator: (val) {
                    return validInput(val!, 5, 50, "username");
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomDropDownMenu(
                      items: const ["عام", "خاص"],
                      intialValue: 'عام',
                      onChanged: (p0) {},
                      label: "البائع",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomDropDownMenu(
                      items: const ["عام", "خاص"],
                      intialValue: 'عام',
                      onChanged: (p0) {},
                      label: "المدرب",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: CustomDateField(
                        label: "تاريخ النهاية",
                        borderRadius: 15,
                        fontSize: 15,
                        width: 145,
                        height: 50,
                        icon: Icons.close,
                        iconSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: CustomDateField(
                        label: "تاريخ البداية",
                        borderRadius: 15,
                        fontSize: 15,
                        width: 145,
                        height: 50,
                        icon: Icons.close,
                        iconSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropDownMenu(
                items: const ["فتنس + كارديو مش شهرى", "فتنس + كارديو شهرى"],
                intialValue: 'فتنس + كارديو شهرى',
                onChanged: (p0) {},
                label: "نوع الاشتراك",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropDownMenu(
                items: const ["عام", "خاص"],
                intialValue: "عام",
                onChanged: (p0) {},
                label: "المجموعة",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "عدد الايام",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "عدد الحصص",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "فيمة الاشتراك",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "الخصم",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "الصافى",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "المدفوع",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "حساب سابق",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "المتبقى",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomDropDownMenu(
                      items: const ["غير نقدى", "نقدى"],
                      intialValue: "نقدى",
                      onChanged: (p0) {},
                      label: "نوع الدفع",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomeTextFormAuth(
                        hintText: "",
                        lableText: "التلفون",
                        validator: (val) {
                          return validInput(val!, 5, 50, "username");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //
              //maybe will change because it is image
              //
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الصوره",
                  validator: (val) {
                    return validInput(val!, 5, 50, "username");
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "الملاحظات",
                  validator: (val) {
                    return validInput(val!, 5, 50, "username");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
