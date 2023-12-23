import 'package:active_system/core/constant/color.dart';
import 'package:flutter/material.dart';



class PaymentDetailsMethode extends StatelessWidget {
  const PaymentDetailsMethode({
    super.key, required this.image,  this.isActive =false,
  });
  final String image ;
  final bool isActive ;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:const Duration(milliseconds: 300),
    width: 93, //103
    height: 62,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.50, color: isActive? ColorApp.secondColor: const Color.fromARGB(255, 26, 26, 26)),
          borderRadius: BorderRadius.circular(15),
          
      ),
      shadows:  [
          BoxShadow(
              color: isActive ? ColorApp.secondColor: Colors.white ,
              blurRadius: 5,
              
          )
      ],
    ),
    child: Container(
    
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)),
    child: Center(child: Image.asset(
       image,
      fit: BoxFit.scaleDown, //مينفعش تزيد عن حجمها الطبيعي
    
      ),
      ),

    ),
);
  }
}