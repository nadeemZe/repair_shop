import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/views/home_screens/repair_history.dart';
import 'package:shop_repair/widgets/custom_app_bar.dart';
import 'package:shop_repair/widgets/custom_bottom_navigator.dart';

class CreateRepair extends StatefulWidget{
  const CreateRepair({Key? key}) : super(key: key);

  @override
  State<CreateRepair> createState() => _CreateRepairState();
}

class _CreateRepairState extends State<CreateRepair> {

  final TextEditingController _streetController= TextEditingController();
  final TextEditingController _cityController= TextEditingController();
  final TextEditingController _subjectController= TextEditingController();
  final TextEditingController _selectCategoryController= TextEditingController();
  final TextEditingController _descriptionController= TextEditingController();

  String? docId=FirebaseAuth.instance.currentUser?.uid;
  CollectionReference<Map<String,dynamic>> users = FirebaseFirestore.instance.collection('users');

  Future<void> createRepair() {
    return users.doc(docId).set({
      'repairs':FieldValue.arrayUnion([{
        'subject': _subjectController.text,
        'street': _streetController.text,
        'city': _cityController.text,
        'description': _descriptionController.text,
        'category': _selectCategoryController.text,
      }])
    },
      SetOptions(merge: true),
    )
        .then((value) => Navigator.push(context, PageTransition(
        child: const RepairHistory(),
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500),
    )
    ))
        .catchError((error) => print("Failed to add repair: $error"));
  }

  @override
  void dispose(){
    _streetController.dispose();
    _cityController.dispose();
    _subjectController.dispose();
    _selectCategoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: CustomAppBar()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: getWidth(context)/1.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width:getWidth(context)/3,
                    child: TextFormField(
                      controller: _streetController,
                      decoration: InputDecoration(
                        hintStyle:const TextStyle(color:Colors.black54),
                        hintText: "Street",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:const BorderSide(
                            color: cusBlue,
                          ),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:const BorderSide(
                              color: cusBlue,
                              width: 1
                          ),
                        ),
                        filled: true,
                        fillColor: cusWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context)/3,
                    child: TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        hintStyle:const TextStyle(color:Colors.black54),
                        hintText: "City",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:const BorderSide(
                            color: cusBlue,
                          ),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:const BorderSide(
                              color: cusBlue,
                              width: 1
                          ),
                        ),
                        filled: true,
                        fillColor: cusWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7,),
            SizedBox(
              width: getWidth(context)/1.3,
              child: TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(
                  hintStyle:const TextStyle(color:Colors.black54),
                  hintText: "Enter your subject",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:const BorderSide(
                      color: cusBlue,
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:const BorderSide(
                        color: cusBlue,
                        width: 1
                    ),
                  ),
                  filled: true,
                  fillColor: cusWhite,
                ),
              ),
            ),
            const SizedBox(height: 7,),
            SizedBox(
              width: getWidth(context)/1.3,
              child: TextFormField(
                controller: _selectCategoryController,
                decoration: InputDecoration(
                  hintStyle:const TextStyle(color:Colors.black54),
                  hintText: "Select a category",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:const BorderSide(
                      color: cusBlue,
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:const BorderSide(
                        color: cusBlue,
                        width: 1
                    ),
                  ),
                  filled: true,
                  fillColor: cusWhite,
                ),
              ),
            ),
            const SizedBox(height: 7,),
            SizedBox(
              width: getWidth(context)/1.3,
              child: TextFormField(
                controller: _descriptionController,
                minLines:4 ,
                maxLines: 7,
                decoration: InputDecoration(
                  hintStyle:const TextStyle(color:Colors.black54),
                  hintText: "Add your description",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:const BorderSide(
                      color: cusBlue,
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:const BorderSide(
                        color: cusBlue,
                        width: 1
                    ),
                  ),
                  filled: true,
                  fillColor: cusWhite,
                ),
              ),
            ),
            const SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getWidth(context)/9,
                  width: getWidth(context)/9,
                  child: Image.asset("assets/attach.jpg",fit: BoxFit.cover,),
                ),
                const SizedBox(width: 3,),
                Text(
                  "Click to Attach",
                  style: TextStyle(
                      color: cusBlack,
                      fontSize: getWidth(context)/35,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 7,),
            SizedBox(
              width: getWidth(context)/1.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(cusBlue),
                        elevation: MaterialStateProperty.all(3),
                        fixedSize: MaterialStateProperty.all(const Size(120,31 )),
                      ),
                      child:Text("Submit",style: TextStyle(color: cusWhite,fontSize: getWidth(context)/25,fontWeight: FontWeight.bold),),
                      onPressed: () {
                        createRepair();
                      }
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cusWhite),
                      elevation: MaterialStateProperty.all(3),
                      fixedSize: MaterialStateProperty.all(const Size(120,31 )),
                    ),
                    child:Text("Cancel",style: TextStyle(color:cusBlue,fontSize:getWidth(context)/25,fontWeight: FontWeight.bold),),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            SizedBox(
              height: getHeight(context)/7,
              width: getHeight(context)/5,
              child: Image.asset(logo,),
            ),
          ],
        ),
      ),
      bottomNavigationBar:const CustomNavigationBar(),
    );
  }
}