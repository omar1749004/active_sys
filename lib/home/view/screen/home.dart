import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/image_asset.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/home/view/widget/client_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
ScrollController controller = ScrollController();
ScrollController controller1 = ScrollController();
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Container(
              height: 70,
              child: Row(
                children: [
                  Image.asset(ImageAsset.lohgo),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Welcome To Your Home",
                    style: Styles.style20,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: 350,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(
                          color: ColorApp.kPrimaryColor,
                          child: Text(
                            "اشتراك",
                            style: Styles.style18,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Text("data"),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "سجل الحضور اليومي",
                            ),
                            SizedBox(
                                height: 750,
                                
                                child: Scrollbar(
                                   thickness: 10,
                                   controller: controller,
                                    thumbVisibility: true,
                                    trackVisibility: true,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    controller: controller,
                                    child: Scrollbar(
                                      thickness: 10,
                                      controller: controller1,
                                      thumbVisibility: true,
                                      trackVisibility: true,
                                      child: SingleChildScrollView(
                                        controller: controller1,
                                         scrollDirection: Axis.horizontal,
                                        
                                        child: DataTable(
                                          
                                          columns: List.generate(
                                            10,
                                            (index) => DataColumn(
                                              label: Text('Header $index'),
                                            ),
                                          ),
                                          rows: List.generate(
                                            20,
                                            (index) => DataRow(
                                              cells: List.generate(
                                                10,
                                                (cellIndex) => DataCell(
                                                  Text('Item $index-$cellIndex'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )),
                  ClinetInfo(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
