import 'package:active_system/core/shared/custom_app_bar.dart';
import 'package:active_system/subscriptions/view/widgets/custom_button.dart';
import 'package:active_system/subscriptions/view/widgets/custom_input_form.dart';
import 'package:active_system/subscriptions/view/widgets/custom_menu.dart';
import 'package:flutter/material.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const CustomMenu(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //
                        //here iframe for display data
                        //
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                text: "أضافه",
                                ontap: () {},
                              ),
                              CustomButton(
                                text: "تعديل",
                                ontap: () {},
                              ),
                              CustomButton(
                                text: "حذف",
                                ontap: () {},
                              ),
                              CustomButton(
                                text: "طباعة",
                                ontap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //here is the form that conaines about Input Forms
                  Container(
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.186)),
                              left: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.186)),
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.186)))),
                      child: const SubscriptionForm())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
