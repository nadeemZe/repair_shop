import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/models/user_model.dart';

import 'home_screens/home.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void moveToHome(context){
     Future.delayed(const Duration(seconds: 5)).then((value) =>
         navigatorScreen(context,const Home())
        );
  }

  String? uId;
  final UserModel _userModel=UserModel();

  @override
  void initState() {
    super.initState();
    uId=FirebaseAuth.instance.currentUser?.uid;
    moveToHome(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _userModel.getUser(uId),
        builder: (context,snapshot) {
          if(snapshot.connectionState!=ConnectionState.done){
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          if(snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.only(top: 51),
              color: cusWhite,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: getWidth(context) / 12,
                        color: cusBlack,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    UserModel.firstName! + ' ' + UserModel.lastName!,
                    style: TextStyle(
                        fontSize: getWidth(context) / 15,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: getHeight(context) / 5.1,),
                  SizedBox(
                    height: getHeight(context) / 5,
                    width: getHeight(context) / 5,
                    child: Image.asset(logo),
                  ),
                ],
              ),
            );
          }
          else{
            return Container(
              color: Colors.transparent,
              child: Center(
                  child: Text("Check your Internet",
                      style: TextStyle(
                        fontSize: getWidth(context) / 25,
                        color: Colors.red,
                      ))),
            );
          }
        }
      ),
    );
  }
}