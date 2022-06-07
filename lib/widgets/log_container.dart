import 'package:flutter/material.dart';
import 'package:shop_repair/constant/helpers.dart';


class LogContainer extends StatelessWidget{
   final double height;
   final double width;
   final Color containerColor;
   final Widget widget;
   final String text;
   final IconData? icon;

  const LogContainer({Key? key,
                      required this.height,
                      required this.width,
                      required this.containerColor,
                      required this.widget,
                      required this.text,
                      required this.icon,
        }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigatorScreen(context, widget);
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: cusWhite,size: width/15,),
            const SizedBox(width: 3,),
            Text('Login with $text',style: TextStyle(color:cusWhite,fontSize: width/15),)
          ],
        ),
      ),
    );
  }
}