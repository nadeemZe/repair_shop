import 'package:flutter/material.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/widgets/log_container.dart';

import 'login.dart';

class Log extends StatefulWidget{
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         height: getHeight(context),
         width: getWidth(context),
         color: cusWhite,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(
               height: getHeight(context)/3,
               width: getHeight(context)/3,
               child: Image.asset(logo),
             ),
             SizedBox(
               height: getHeight(context)/35,
             ),
             Text(
               'welcome to SHOP',
               style: TextStyle(
                 fontSize: getWidth(context)/21,
                 fontWeight: FontWeight.bold,
                 color: cusBlack
               ),
             ),
             const SizedBox(height: 3,),
             Text(
               'REPAIR Center',
               style: TextStyle(
                 fontSize: getWidth(context)/21,
                 fontWeight: FontWeight.bold,
               ),
             ),
             const SizedBox(height: 45,),
             LogContainer(
               height: getHeight(context)/17,
               width: getWidth(context)/2,
               containerColor: cusGrey,
               widget: const LogIn(),
               text: "Email",
               icon: Icons.email,
             ),
             const SizedBox(height: 7,),
             LogContainer(
               height: getHeight(context)/17,
               width: getWidth(context)/2,
               containerColor: cusBlue,
               widget: const LogIn(),
               text: "Facebook",
               icon: Icons.face,
             ),
             const SizedBox(height: 7,),
             LogContainer(
               height: getHeight(context)/17,
               width: getWidth(context)/2,
               containerColor: cusBlack,
               widget: const LogIn(),
               text: "Apple",
               icon: Icons.ad_units,
             ),
             const SizedBox(height:12),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                     "Dont have an account",
                      style: TextStyle(color: cusBlue,fontSize: getWidth(context)/40),
                     ),
                 InkWell(
                   onTap: (){

                   },
                   child: Text(
                     " Signup",
                     style: TextStyle(
                         color: cusBlack,
                         fontWeight: FontWeight.bold,
                         fontSize: getWidth(context)/35
                     ),
                   ),
                 ),
               ],
             ),
             const SizedBox(height: 10,),
             ElevatedButton.icon(
               onPressed: null,
               style: ButtonStyle(
                 backgroundColor:MaterialStateProperty.all(cusWhite),
                 side: MaterialStateProperty.all(const BorderSide(color:cusBlue,width: 1)),
               ),
               label: Text(
                 'English',
                 style:TextStyle(
                   color: cusBlue,
                   fontSize:getWidth(context) / 30,
                 ) ,),
               icon: Icon( Icons.language_outlined,color: cusBlue,size: getWidth(context) / 21,),
             ),
           ],
         ),
      ),
    );
  }
}