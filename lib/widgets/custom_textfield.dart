import 'package:flutter/material.dart';
import 'package:shop_repair/constant/helpers.dart';

class CustomTextField extends StatelessWidget{
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  const CustomTextField({Key? key,
                         required this.controller,
                         required this.hintText,
                         required this.icon,

                        }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return TextFormField(
     controller: controller,
     decoration: InputDecoration(
         hintStyle:const TextStyle(color:Colors.black54),
         hintText:hintText ,
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
           borderSide:const BorderSide(
             color: cusBlue,
           ),
         ),
         focusedBorder:OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
           borderSide:const BorderSide(
               color: cusBlue,
               width: 1
           ),
         ),
         filled: true,
         fillColor:cusWhite ,
         prefixIcon: Icon(icon, color:cusBlue,)
     ),
   );
  }
}