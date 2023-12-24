import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/constant/styles%20copy.dart';
import 'package:active_system/home/data/service/static/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClinetInfo extends StatelessWidget {
  const ClinetInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
                    flex: 1,
                    child: Container(
                     
                      padding:const EdgeInsets.only(top: 10,right: 20),
                      child: SingleChildScrollView(
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
                                    size:  MediaQuery.of(context).size.width * 0.04,
                                  ),
                                ),
                                Container(
                                  padding:const EdgeInsets.only(top: 20 ,bottom: 30,left: 30),
                                  child: CircleAvatar(
                                    backgroundColor: ColorApp.gray,
                                    radius:  MediaQuery.of(context).size.width * 0.06,
                                  ),
                                )
                              ],
                            ),
                            ...List.generate(profile.length, (index) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:const EdgeInsets.symmetric(vertical: 9),
                                  padding:const EdgeInsets.only(right: 10 , left: 10),
                                  width:  MediaQuery.of(context).size.width *0.18, 
                                child: Text("jsfs sgfsrgsrg sgsrg dafd a" ,textAlign: TextAlign.right,style: TextStyle(fontSize: 20 ,height: 2),),
                                decoration: BoxDecoration(border: Border.all(color: Colors.grey,),),
                                ),
                               Text(profile[index] ,style: Styles.style20,)
                              ],
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}