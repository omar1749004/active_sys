import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/image_asset.dart';
import 'package:active_system/core/constant/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        child: Text("data"),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(top: 10,right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.antenna_radiowaves_left_right,
                                  color: ColorApp.kPrimaryColor,
                                  size: 50,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20 ,bottom: 30,left: 30),
                                child: CircleAvatar(
                                  backgroundColor: ColorApp.gray,
                                  radius: 100,
                                ),
                              )
                            ],
                          ),
                          ...List.generate(6, (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 9),
                                padding: EdgeInsets.only(right: 5),
                                width: 320, 
                              child: Text("jsfs fgjsgjsghg" ,textAlign: TextAlign.right,style: TextStyle(fontSize: 20 ,height: 2),),
                              decoration: BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.800000011920929))),
                              ),
                              Text("الاسم" ,style: Styles.style23,)
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
