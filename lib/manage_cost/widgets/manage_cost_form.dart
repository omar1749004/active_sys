import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_input_form.dart';
import 'package:flutter/material.dart';

class MangeCostForm extends StatelessWidget {
  const MangeCostForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //
            //field الاجمالى
            //
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: "ألاجمالى",
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
                  const Text("اجمالى المصروفات")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //
            //feild رقم المصروف
            //
            SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                textDirection: TextDirection.rtl,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "رقم المصروف",
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
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDateField(
                      width: 150,
                      height: 40,
                      icon: Icons.close,
                      iconSize: 20,
                      fontSize: 18),
                  const Text("التاريخ")
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInputForm(
              labelText: 'تكلفه المصروف',
              dataType: num,
              size: 300,
              maxline: 1,
            ),
            CustomInputForm(
              labelText: 'سبب الصرف',
              dataType: String,
              size: 300,
              maxline: 3,
            ),

            CustomInputForm(
              labelText: 'ملاحظات',
              dataType: String,
              size: 300,
              maxline: 3,
            ),
          ],
        ),
      ),
    );
  }
}
