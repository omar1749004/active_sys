import 'package:active_system/controller/mange_player.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_dropdown_menu.dart';
import 'package:active_system/features/safe/view/widget/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchTools extends StatelessWidget {
  const SearchTools({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MangeUsersControllerImp>(
        builder: (controller) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          flex: 5,
                          child: CustomCheckBox(
                            ischeck: controller.isborrowed,
                            text: "اللاعبين اللذين عليهم مبالغ",
                          onTap: () {

                           controller.changeBorrowed(controller.isborrowed);
                          },
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomCheckBox(
                          ischeck: controller.isDateSearch,
                          text: "تاريخ الانضمام",
                          color: Colors.red,
                          onTap: () {

                           controller.changeDate(controller.isDateSearch);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomDropDownMenu(
                            label: "نوع الاشتراك",
                            items: controller.subNameSearchList,
                            onChanged: (p0) {
                              controller.changeSearchmodel(p0!);
                            },
                            intialValue: controller.subSearchValue),
                      ),
                    ],
                  ),
                ),
                //
                //checkbox for search
                //
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomCheckBox(
                        ischeck: controller.isexpire,
                        text: " اشتراكات منتهيه",
                          onTap: () {

                           controller.changeExpire(controller.isexpire);
                          },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomDateField(
                        borderRadius: 15,
                        fontSize: 15,
                        currentValue: DateTime.now(),
                        width: 210,
                        height: 35,
                        iconSize: 20,
                        format: DateFormat('yyyy-MM'),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 5,
                      child: CustomCheckBox(
                        ischeck: controller.isactiveSearch,
                        text: "اشتراكات ساريه",
                          onTap: () {

                           controller.changeActiveSearch(controller.isactiveSearch);
                          },
                      ),
                    )
                  ],
                ),
              ],
            ));
  }
}
