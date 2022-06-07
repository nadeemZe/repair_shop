import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/controllers/app_state_controller.dart';
import 'package:shop_repair/models/user_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shop_repair/views/home_screens/create_repair.dart';
import 'package:shop_repair/widgets/custom_app_bar.dart';
import 'package:shop_repair/widgets/custom_bottom_navigator.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final TextEditingController _fNameController= TextEditingController();

  void editProfileDialog(context,) {
    showDialog(
      context:context,
      builder: (BuildContext c) {
        var h=MediaQuery.of(c).size.height;
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: cusWhite,
          contentPadding:const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content: SizedBox(
              height:h/4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h/15,
                    child: TextFormField(
                      controller: _fNameController,
                      decoration: InputDecoration(
                          hintStyle:const TextStyle(color:Colors.black54),
                          hintText: "Name",
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
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: h/15,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintStyle:const TextStyle(color:Colors.black54),
                        hintText: "Email",
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
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: h/15,
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintStyle:const TextStyle(color:Colors.black54),
                        hintText: "Password",
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
              )
          ),
          actions: <Widget>[
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cusWhite),
                  elevation: MaterialStateProperty.all(3),
                ),
                child:Text("Update",style: TextStyle(color: Colors.black54,fontSize: h/45,fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.of(c).pop();
                }
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(cusWhite),
                elevation: MaterialStateProperty.all(3),
              ),
              child:Text("Cancel",style: TextStyle(color: Colors.black54,fontSize:h/45,fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(c).pop();
                setState(() {
                });
              },
            ),
          ],
        );
      },
    );
  }


  @override
  void initState(){
    super.initState();
    AppState.uid=FirebaseAuth.instance.currentUser?.uid;
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _fNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: CustomAppBar()),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius:getHeight(context)/9 ,
                backgroundImage:const AssetImage('assets/person.jpg'),
              ),
              const SizedBox(height: 25,),
              Container(
                height: getHeight(context)/3,
                width: getWidth(context)/1.2,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Profile",
                            style: TextStyle(
                              color: cusBlack,
                              fontWeight: FontWeight.bold,
                              fontSize:getWidth(context) / 21,
                            ),),
                        ) ,
                        IconButton(
                          onPressed:(){
                          } ,
                          icon: const Icon(Icons.person,color: cusBlue,),
                        ),
                        IconButton(
                          onPressed:(){
                            editProfileDialog(context);
                          } ,
                          icon: const Icon(Icons.edit,color: cusBlue,),
                        ),
                      ],
                    ),
                    const Divider(height: 2,color: cusGrey,),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Text(
                          "Name :",
                          style: TextStyle(
                            color: cusBlue,
                            fontWeight: FontWeight.bold,
                            fontSize:getWidth(context) / 23,
                          ),),
                        Text(
                          UserModel.firstName!,
                          style: TextStyle(
                            color: cusBlack,
                            fontWeight: FontWeight.bold,
                            fontSize:getWidth(context) / 23,
                          ),),
                      ]
                    ),
                    const SizedBox(height: 5,),
                    Row(
                        children: [
                          Text(
                            "Email :",
                            style: TextStyle(
                              color: cusBlue,
                              fontWeight: FontWeight.bold,
                              fontSize:getWidth(context) / 23,
                            ),),
                          Text(
                            UserModel.email!,
                            style: TextStyle(
                              color: cusBlack,
                              fontWeight: FontWeight.bold,
                              fontSize:getWidth(context) / 23,
                            ),),
                        ]
                    ),
                    const SizedBox(height: 25,),
                    SizedBox(
                      width: getWidth(context),
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, PageTransition(
                                child: const CreateRepair(),
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: const Duration(milliseconds:500)
                            )
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(cusBlue)
                          ),
                          child: Text(
                            "Create Repair",
                            style: TextStyle(
                              color: cusWhite,
                              fontWeight: FontWeight.bold,
                              fontSize:getWidth(context) / 25,
                            ),)
                      ),
                    ),
                    const SizedBox(height: 3,),
                    SizedBox(
                      width: getWidth(context),
                      child: ElevatedButton(
                          onPressed: (){
                            //navigatorScreen(context, const Verify());
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(cusBlue)
                          ),
                          child: Text(
                            "My Repair Request",
                            style: TextStyle(
                              color: cusWhite,
                              fontWeight: FontWeight.bold,
                              fontSize:getWidth(context) / 25,
                            ),)
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              SizedBox(
                height: getHeight(context)/5,
                width: getHeight(context)/5,
                child: Image.asset(logo),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}