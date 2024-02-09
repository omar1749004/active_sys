import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/features/safe/view/widget/custom_checkbox.dart';
import 'package:flutter/material.dart';

class SearchTools extends StatelessWidget {
  const SearchTools({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomDropDownMenu(
                          label: "نوع الاشتراك",
                          items: ["الكل", "مخصص"],
                          intialValue: "مخصص"),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomDropDownMenu(
                          label: "البائع",
                          items: ["الكل", "مخصص"],
                          intialValue: "الكل"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomDropDownMenu(
                          label: " الاشتراك",
                          items: ["الكل", "مخصص"],
                          intialValue: "مخصص"),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomDropDownMenu(
                          label: "المجموعه",
                          items: ["الكل", "مخصص"],
                          intialValue: "الكل"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //
        //checkbox for search
        //
        SizedBox(
          height: 5,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Expanded(child: CustomCheckBox(ischeck: true, text: "مدينيين")),
              Expanded(
                  child: CustomCheckBox(ischeck: true, text: "غير مجددين")),
              Expanded(
                child: CustomCheckBox(ischeck: true, text: " اشتراكات منتهيه"),
              ),
              Expanded(
                child: CustomCheckBox(ischeck: true, text: "اشتراكات ساريه"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
