import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/models/repairs_dir/repair_model.dart';
import 'package:shop_repair/widgets/custom_app_bar.dart';
import 'package:shop_repair/widgets/custom_bottom_navigator.dart';
import 'messages.dart';

class RepairView extends StatelessWidget{
  final RepairModel repairModel;
  const RepairView({Key? key,required this.repairModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: CustomAppBar()),
      body: Container(
        padding: const EdgeInsets.all(25),
        decoration:const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            side: BorderSide(color: cusGrey)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            Row(
              children: [
                Text(
                  "Subject:",
                  style: TextStyle(
                      color: cusBlue,
                      fontSize: getWidth(context)/12,
                      fontWeight:FontWeight.bold
                  )
                ),
                Text(
                    repairModel.subject!,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: getWidth(context)/15
                    )
                ),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                Text(
                    "Category:",
                    style: TextStyle(
                        color: cusBlue,
                        fontSize: getWidth(context)/12,
                        fontWeight:FontWeight.bold
                    )
                ),
                Text(
                    repairModel.category!,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: getWidth(context)/15
                    )
                ),
              ],
            ),
            const SizedBox(height: 25,),
            const Divider(color: cusGrey,),
            const SizedBox(height: 5,),
            Text(
                "Description",
                style: TextStyle(
                    color: cusBlue,
                    fontSize: getWidth(context)/20,
                    fontWeight:FontWeight.bold
                )
            ),
            const SizedBox(height: 5,),
            Expanded(
              child: SizedBox(
                height: getHeight(context)/17,
                child: Text(
                       repairModel.description!,
                        style: TextStyle(
                        color: Colors.black45,
                        fontSize: getWidth(context)/25
                    )
                ),
              ),
            ),
            const SizedBox(height: 35,),
            Text(
                "Attachements",
                style: TextStyle(
                    color: cusBlue,
                    fontSize: getWidth(context)/20,
                    fontWeight:FontWeight.bold
                )
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: getWidth(context)/7,
                  width: getWidth(context)/7,
                  child: Image.asset("assets/attach.jpg",fit: BoxFit.cover,),
                ),
                SizedBox(
                  height: getWidth(context)/9,
                  width: getWidth(context)/9,
                  child: Image.asset("assets/attach.jpg",fit: BoxFit.cover,),
                ),
                SizedBox(
                  height: getWidth(context)/9,
                  width: getWidth(context)/9,
                  child: Image.asset("assets/attach.jpg",fit: BoxFit.cover,),
                ),
              ],
            ),
            const SizedBox(height: 35,),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(cusBlue),
                    elevation: MaterialStateProperty.all(3),
                    fixedSize: MaterialStateProperty.all(const Size(113,45)),
                  ),
                  child:Text("message",style: TextStyle(color: cusWhite,fontSize: getWidth(context)/25,fontWeight: FontWeight.bold),),
                  onPressed: () {
                    Navigator.push(context, PageTransition(
                      child: const Messages(),
                      childCurrent: this,
                      type: PageTransitionType.bottomToTopJoined,
                      duration: const Duration(milliseconds: 700),
                    )
                    );
                  }
              ),
            ),
            const SizedBox(height: 25,),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: getHeight(context)/7,
                width: getHeight(context)/5,
                child: Image.asset(logo,),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:const CustomNavigationBar(),
    );
  }

}