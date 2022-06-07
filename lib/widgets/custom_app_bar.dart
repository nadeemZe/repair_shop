import 'package:flutter/material.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/models/user_model.dart';

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: cusWhite,
      elevation: 0,
      title:Text(
        UserModel.firstName!,
        style: TextStyle(
          color: cusBlack,
          fontWeight: FontWeight.bold,
          fontSize:getWidth(context) / 15,
        ),) ,
      leading: IconButton(
        onPressed:(){
          Navigator.pop(context);
        } ,
        icon: const Icon(Icons.arrow_back_ios,color: cusBlack,),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 10),
          child: ElevatedButton.icon(
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
        ),
        Padding(
          padding: const EdgeInsets.only(right: 7.0),
          child: IconButton(
            onPressed:(){
            } ,
            icon: const Icon(Icons.notifications,color: cusBlue,),
          ),
        ),

      ],
    );
  }
}