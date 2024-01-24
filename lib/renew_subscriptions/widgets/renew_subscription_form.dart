import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custom_input_form.dart';
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
                width: 300,
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
                      width: 40,
                    ),
                    CustomInputForm(labelText: 'كود', dataType: int, size: 145),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //
              //here the text field that will shown number of renew
              //
              SizedBox(
                width: 150,
                height: 40,
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  readOnly: false,
                  decoration: const InputDecoration(
                    hintText: "رقم التسلسل",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
              CustomInputForm(
                  labelText: 'أسم اللاعب ', dataType: String, size: 300),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 145,
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
                  SizedBox(
                    width: 145,
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
                  SizedBox(
                      width: 145,
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
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 145,
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
              SizedBox(
                width: 300,
                child: CustomDropDownMenu(
                  items: const ["فتنس + كارديو مش شهرى", "فتنس + كارديو شهرى"],
                  intialValue: 'فتنس + كارديو شهرى',
                  onChanged: (p0) {},
                  label: "نوع الاشتراك",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: CustomDropDownMenu(
                  items: const ["عام", "خاص"],
                  intialValue: "عام",
                  onChanged: (p0) {},
                  label: "المجموعة",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInputForm(
                      labelText: 'عدد الايام', dataType: int, size: 145),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomInputForm(
                      labelText: "عدد الحصص", dataType: int, size: 145),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInputForm(
                      labelText: 'قيمة الاشتراك', dataType: int, size: 145),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomInputForm(labelText: "الخصم", dataType: int, size: 145),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInputForm(
                      labelText: 'الصافى', dataType: int, size: 145),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomInputForm(
                      labelText: "المدفوع", dataType: int, size: 145),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInputForm(
                      labelText: 'حساب سابق', dataType: int, size: 145),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomInputForm(
                      labelText: "المتبقى", dataType: int, size: 145),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 145,
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
                  CustomInputForm(
                      labelText: "التلفون", dataType: int, size: 145),
                ],
              ),
              //
              //maybe will change because it is image
              //
              CustomInputForm(labelText: "الصوره", dataType: Image, size: 300),
              CustomInputForm(
                labelText: "الملاحظات",
                dataType: String,
                size: 300,
                maxline: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
