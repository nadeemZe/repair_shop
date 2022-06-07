import 'package:flutter/material.dart';
import 'package:shop_repair/views/welcome.dart';
import 'package:shop_repair/widgets/custom_textfield.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/views/log/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget{
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final TextEditingController _forgetPasswordController= TextEditingController();

  bool loading=false;

  void showMyDialog(context,) {
    showDialog(
      context:context,
      builder: (BuildContext c) {
        var h=MediaQuery.of(c).size.height;
        var w=MediaQuery.of(c).size.width;
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: cusWhite,
          contentPadding:const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content: SizedBox(
              height:h/7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( "Write Your Email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: w/25,
                    ),
                  ),
                  const SizedBox(height: 12,),
                  SizedBox(
                    height: h/15,
                    child: TextFormField(
                      controller: _forgetPasswordController,
                      decoration: InputDecoration(
                          hintStyle:const TextStyle(color:Colors.black54),
                          hintText: "email",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:const BorderSide(
                              color: cusWhite,
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
                          fillColor: cusWhite,
                          prefixIcon:const Icon(Icons.email_rounded, color:cusBlue,)
                      ),
                    ),
                  ),
                ],
              )
          ),
          actions: <Widget>[
            TextButton(
                child:Text("Send",style: TextStyle(color: Colors.black54,fontSize: h/45,fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.of(c).pop();
                }
            ),
            TextButton(
              child:Text("Cancel",style: TextStyle(color: Colors.black54,fontSize:h/45,fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(c).pop();
                setState(() {
                  _forgetPasswordController.clear();
                });
              },
            ),
          ],
        );
      },
    );
  }

  signIn()async{
    setState(() {
      loading=true;
    });
     await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      ).then((value){
          navigatorScreen(context,const WelcomeScreen());

      }).catchError((e)=>print(e));
   /* } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }*/
  }
  
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _forgetPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
       loading
        ?Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
                   color: Colors.blue,
               ),
        )
    :
    Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: cusWhite,
        elevation: 0,
        title:Text(
          "Login",
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
              const SizedBox(height: 3,),
              CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  icon: Icons.email
              ),
              const SizedBox(height: 17,),
              Align(
                alignment:Alignment.bottomRight,
                child: InkWell(
                  onTap: (){
                    showMyDialog(context);
                  },
                  child: Text(
                    "Forget Password?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize:getWidth(context) / 40,
                  ),)
                ),
              ),
              const SizedBox(height: 3,),
              CustomTextField(
                  controller: _passwordController,
                  hintText: 'password',
                  icon: Icons.lock
              ),
              const SizedBox(height:7,),
              SizedBox(
                width: getWidth(context),
                child: ElevatedButton(
                    onPressed: (){
                      signIn();
                     // navigatorScreen(context, const WelcomeScreen());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cusBlue)
                    ),
                    child: Text(
                      "Login",
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
                    "Don't have an account",
                    style: TextStyle(
                      color: cusBlue,
                      fontSize:getWidth(context) / 40,
                    ),),
                  TextButton(
                      onPressed: (){
                        navigatorScreen(context, const SignUp());
                      },
                      child: Text(
                        "Signup",
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