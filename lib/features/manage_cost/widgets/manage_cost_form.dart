import 'package:active_system/controller/expenses_controller.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/functions/validate_input.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custome_textform_auth.dart';
import 'package:active_system/features/safe/view/widget/custom_display_many.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeCostForm extends GetView<ExpensesControllerImp> {
  const MangeCostForm({required this.many, super.key});
  final String many ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(

        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              //
              //field الاجمالى
              //
              Text(
                "بيانات الخزنة",
                style: Styles.style23,
              ),
              const SizedBox(
                height: 20,
              ),
              //
              //feild رقم المصروف
              //
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 40,
                        child: CustomDisplyMany(
                            textColor: Colors.red,
                            many: many,
                            text: "اجمالي المصروفات")),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //
              //date button
              //
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomDateField(
                        width: 200,
                        height: 40,
                        iconSize: 20,
                        isaccess: false,
                        fontSize: 18),
                    const Text(
                      "التاريخ",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),

              ),
              const SizedBox(
                height: 20,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "تكلفة المصروفات",
                  myController: controller.amount,
                  mainTextColor: Colors.red,
                  onChanged: (p0) {
                    controller.handleprice();
                  },
                  validator: (val) {
                    return validInput(val!, 1, 50, "num");
                  }),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  myController: controller.reason,
                  lableText: "سبب الصرف",
                  validator: (val) {
                    return validInput(val!, 3, 50, "");
                  }),
              const SizedBox(
                height: 15,
              ),
              CustomeTextFormAuth(
                  hintText: "",
                  lableText: "ملاحظات",
                  myController: controller.note,
                 ),
            ],
          ),
        ),
      ),
    );
  }
}
