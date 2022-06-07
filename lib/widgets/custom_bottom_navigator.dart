import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_repair/constant/helpers.dart';
import '../views/home_screens/create_repair.dart';
import '../views/home_screens/home.dart';
import '../views/home_screens/repair_history.dart';

class CustomNavigationBar extends StatelessWidget{
  const CustomNavigationBar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(top:10, bottom:10,),
      decoration:const BoxDecoration(
          color: cusBlack,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight:Radius.circular(25) )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: (){
                Navigator.push(context, PageTransition(
                  child: const Home(),
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 500),
                )
                );
              },
              icon:const Icon( Icons.home,color: cusWhite,)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(context, PageTransition(
                  child: const CreateRepair(),
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 500),
                )
                );
              },
              icon:const Icon( Icons.home_repair_service,color: cusWhite,)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(context, PageTransition(
                  child: const RepairHistory(),
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 500),
                )
                );
              },
              icon:const Icon( Icons.history,color: cusWhite,)
          ),
          const IconButton(
              onPressed: null,
              icon:Icon( Icons.logout,color: cusWhite,)
          ),
        ],
      )
    );
  }
}