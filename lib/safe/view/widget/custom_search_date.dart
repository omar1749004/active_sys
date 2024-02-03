import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:flutter/material.dart';

class CustomSearchDate extends StatelessWidget {
  const CustomSearchDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomDateField(
                                    width: 150,
                                    height: 30,
                                    icon: Icons.close,
                                    iconSize: 15,
                                    fontSize: 15),
                                const Text(
                                  "الى ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                CustomDateField(
                                    width: 150,
                                    height: 30,
                                    icon: Icons.close,
                                    iconSize: 15,
                                    fontSize: 15),
                                const Text(
                                  "من ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  child: CustomBotton1(
                                    text: "بحث",
                                    ontap: () {},
                                    color: ColorApp.kPrimaryColor,
                                    marginBottom: 0,
                                    marginLeft: 0,
                                    marginRight: 0,
                                    marginTop: 0,
                                  ),
                                ),
                                Text(
                                  "سجل الخزنة",
                                  style: Styles.style23,
                                ),
                              ],
                            );
  }
}