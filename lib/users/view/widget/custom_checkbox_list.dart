import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/menu_items.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxList extends StatelessWidget {
  const CustomCheckBoxList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
                              ...List.generate(
                                  serviceName.length,
                                  (index) => Row(
                                    
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            "مفعلة",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Checkbox(
                                              activeColor:
                                                  ColorApp.kPrimaryColor,
                                              value: true,
                                              onChanged: (val) {
                                                val != val;
                                              }),
                                          Container(
                                              width: MediaQuery.of(context).size.width* 0.08,
                                              padding:const EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 5),
                                              margin:const EdgeInsets.symmetric(
                                                  vertical: 5),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 235, 235, 235),
                                                  border: Border.all(
                                                      color: Colors.black54)),
                                              child: Text(
                                                serviceName[index],
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.end,
                                              ))
                                        ],
                                      ))
                            ]);
  }
}