import 'package:flutter/material.dart';


class CustomBotton1 extends StatelessWidget {
  const CustomBotton1({super.key, required this.ontap, required this.text,  this.hieght = 70, required this.color});
  final Function()? ontap;
  final String text;
  final double hieght ;
  final Color color ;
  @override
  Widget build(BuildContext context) {

    return 
      Align(
        child: Container(
          margin:const EdgeInsets.only(left: 20 ,right: 20, top: 35),
            
            
          child: MaterialButton(
            height: 40,
            onPressed: ontap,
           padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
             color: color ,
            child: 
             
               Center(child: Text(text,
              style:const TextStyle(color: Colors.white,
              fontSize: 16,
              
              ),
              ),),

              ),
            ),
          );
        
    
    
  }
}
