import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:flutter/material.dart';

class TreasuryRegisterForm extends StatefulWidget {
  const TreasuryRegisterForm({super.key});

  @override
  State<TreasuryRegisterForm> createState() => _TreasuryRegisterFormState();
}

class _TreasuryRegisterFormState extends State<TreasuryRegisterForm> {
  bool? _checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                      icon: Icons.close,
                      iconSize: 18,
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
                      icon: Icons.close,
                      iconSize: 18,
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
                lableText: "بحث (الوصف)",
                validator: (val) {
                  return validInput(val!, 5, 50, "username");
                }),
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
            CheckboxListTile(
              title: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "تجاهل البيانات والحذف",
                  style: Styles.style18B,
                ),
              ),
              value: _checkedValue,
              onChanged: (value) {
                setState(() {
                  _checkedValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
