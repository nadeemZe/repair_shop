import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_repair/widgets/custom_textfield.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/views/log/verify_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? docId;

  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final TextEditingController _fNameController= TextEditingController();
  final TextEditingController _lNameController= TextEditingController();

  signup() async {
    //try {
      //UserCredential userCredential = await
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text).then((value){
            // get uid from userAuth and create doc with id equal uid
            // help when get doc info
            docId=value.user?.uid;
            addUser();
            navigatorScreen(context, const Verify());
          }).catchError((e)=>print(e));
    //}
   /* on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }*/
    /*catch (e)
      print(e);
    }*/
  }
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(docId).set({
      'first_name': _fNameController.text,
      'last_name': _lNameController.text,
      'email': _emailController.text,
      'password': _passwordController.text
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fNameController.dispose();
    _lNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: cusWhite,
        elevation: 0,
        title:Text(
          "SignUp",
          style: TextStyle(
            color: cusBlack,
            fontWeight: FontWeight.bold,
            fontSize:getWidth(context) / 15,
          ),) ,
        centerTitle: true,
        leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          } ,
          icon: const Icon(Icons.arrow_back_ios,color: cusBlack,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: getHeight(context),
          width: getWidth(context),
          padding: const EdgeInsets.all(25),
          color: cusWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: getHeight(context)/3,
                width: getHeight(context)/3,
                child: Image.asset(logo),
              ),
              const SizedBox(height:3 ,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  SizedBox(
                    width: getWidth(context)/2.5,
                    child: CustomTextField(
                        controller: _fNameController,
                        hintText: 'F Name',
                        icon: Icons.person
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context)/2.5,
                    child: CustomTextField(
                        controller: _lNameController,
                        hintText: 'L Name',
                        icon: Icons.person
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  icon: Icons.email
              ),
              const SizedBox(height: 12,),
              CustomTextField(
                  controller: _passwordController,
                  hintText: 'password',
                  icon: Icons.lock
              ),
              const SizedBox(height:17,),
              SizedBox(
                width: getWidth(context),
                child: ElevatedButton(
                    onPressed: (){
                      signup();

                   //   navigatorScreen(context, const Verify());
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(cusBlue)
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: cusWhite,
                        fontWeight: FontWeight.bold,
                        fontSize:getWidth(context) / 25,
                      ),)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
                    style: TextStyle(
                      color: cusBlue,
                      fontSize:getWidth(context) / 40,
                    ),),
                  TextButton(
                      onPressed: (){
                        navigatorScreen(context, const LogIn());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: cusBlack,
                          fontWeight: FontWeight.bold,
                          fontSize:getWidth(context) / 30,
                        ),)
                  ),
                ],
              ),
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
      ),
    );
  }
}