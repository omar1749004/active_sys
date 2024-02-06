import 'package:active_system/controller/admin_controller.dart';
import 'package:active_system/core/constant/color.dart';
import 'package:active_system/features/users/data/service/static/powers_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBoxList extends StatelessWidget {
   CustomCheckBoxList({super.key});
final ScrollController vscrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 232, 232, 232),
      child: Scrollbar(
        thickness: 5,
        controller: vscrollController,
          thumbVisibility: true,
          trackVisibility: true,
        child:
        GetBuilder<AdminControllerImp>(builder: (controller) => 
         ListView(
          controller: vscrollController,
          scrollDirection: Axis.vertical,
          children: [
          ...List.generate(
              powers.length,
              (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "مفعلة",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                          activeColor: ColorApp.kPrimaryColor,
                          value: checkValueList[index],
                          onChanged: (val) {
                            val != val;
                            controller.changecheckvalue(index ,val!);
                            controller.handleselectPoewr(index+1, val) ;
      
                          }),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.08,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color:colorsList[index],
                              border: Border.all(color: Colors.black54)),
                          child: Text(
                            powers[index],
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ))
                    ],
                  ))
        ]),)
      ),
    );
  }
}
