import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/custom_Botton1.dart';
import 'package:active_system/core/shared/custom_date_field.dart';
import 'package:active_system/core/shared/custom_table.dart';
import 'package:active_system/players_profile/widgets/app_bar_profile.dart';
import 'package:active_system/players_profile/widgets/card_info.dart';
import 'package:flutter/material.dart';

class PlayersProfileView extends StatefulWidget {
  const PlayersProfileView({super.key});

  @override
  State<PlayersProfileView> createState() => _PlayersProfileViewState();
}

class _PlayersProfileViewState extends State<PlayersProfileView> {
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //
          //Appbar
          //
          AppBarProfilePage(
            buttonId: (id) {
              updateId(id);
            },
          ),
          //
          //content (table and client info)
          //
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, right: 5, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //
                        //search by date
                        //
                        id == 4
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                  ],
                                ),
                              )
                            : Text("", style: TextStyle(height: 0)),
                        id == 5
                            ? Text(
                                "مدفوعات",
                                style: Styles.style20,
                              )
                            : Text(
                                "",
                                style: TextStyle(height: 0),
                              ),
                        //
                        //first table
                        //
                        Expanded(
                          flex: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 231, 230, 230),
                                    width: 5)),
                            child: CustomTable(
                              columnsHeader: const [
                                Text("1"),
                                Text("2"),
                                Text("3"),
                                Text("4"),
                                Text("1"),
                                Text("2"),
                                Text("3"),
                                Text("1"),
                                Text("2"),
                                Text("3"),
                                Text("4"),
                                Text("1"),
                                Text("2"),
                              ],
                              rowInfo: const [
                                'data11',
                                "data12",
                                "data13",
                                "data14",
                                'data11',
                                "data12",
                                "data13",
                                "data13",
                                "data14",
                                'data11',
                                "data13",
                                "data14",
                                'data11',
                                "data13",
                                "data14",
                                'data11',
                              ],
                            ),
                          ),
                        ),
                        //
                        //second table
                        //
                        id == 5
                            ? Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "تجديدات",
                                      style: Styles.style20,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 231, 230, 230),
                                                width: 10)),
                                        child: CustomTable(
                                          columnsHeader: const [
                                            Text("1"),
                                            Text("2"),
                                            Text("3"),
                                            Text("4"),
                                            Text("1"),
                                            Text("2"),
                                            Text("3"),
                                            Text("1"),
                                            Text("2"),
                                            Text("3"),
                                            Text("4"),
                                            Text("1"),
                                            Text("2"),
                                          ],
                                          rowInfo: const [
                                            'data11',
                                            "data12",
                                            "data13",
                                            "data14",
                                            'data11',
                                            "data12",
                                            "data13",
                                            "data13",
                                            "data14",
                                            'data11',
                                            "data13",
                                            "data14",
                                            'data11',
                                            "data13",
                                            "data14",
                                            'data11',
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const Text(""),
                      ],
                    ),
                  ),
                ),
                //
                //client info
                //
                const Expanded(flex: 1, child: CardInfo()),
              ],
            ),
          )
        ],
      ),
    );
  }

  void updateId(int newId) {
    setState(() {
      id = newId;
    });
  }
}
