import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/views/welcome.dart';


class Verify extends StatefulWidget{
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final TextEditingController _firstController= TextEditingController();
  final TextEditingController _secondController= TextEditingController();
  final TextEditingController _thirdController= TextEditingController();
  final TextEditingController _fourthController= TextEditingController();


  @override
  void dispose(){
    super.dispose();
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: cusWhite,
        elevation: 0,
        title:Text(
          "Verify code",
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
              Text(
                'We send you a 4 digit code',
                style: TextStyle(
                  fontSize: getWidth(context)/21,
                  fontWeight: FontWeight.bold,
                  color: cusBlack
                ),
              ),
              const SizedBox(height:51 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'OTP',
                    style: TextStyle(
                        fontSize: getWidth(context)/25,
                        color: cusBlack,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Resend code',
                    style: TextStyle(
                        fontSize: getWidth(context)/35,
                        color: Colors.black38
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  SizedBox(
                    width: getWidth(context)/6,
                    child: CodeTextField(
                      controller: _firstController,
                    )
                  ),
                  SizedBox(
                    width: getWidth(context)/6,
                    child:CodeTextField(
                      controller: _secondController,
                    )
                  ),
                  SizedBox(
                      width: getWidth(context)/6,
                      child: CodeTextField(
                        controller: _thirdController,
                      )
                  ),
                  SizedBox(
                      width: getWidth(context)/6,
                      child: CodeTextField(
                        controller: _fourthController,
                      )
                  ),
                ],
              ),
              const SizedBox(height:41,),
              SizedBox(
                width: getWidth(context),
                child: ElevatedButton(
                    onPressed: (){
                     // navigatorScreen(context, const WelcomeScreen());
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(cusBlue)
                    ),
                    child: Text(
                      "Finish",
                      style: TextStyle(
                        color: cusWhite,
                        fontWeight: FontWeight.bold,
                        fontSize:getWidth(context) / 25,
                      ),)
                ),
              ),
              const SizedBox(height: 15,),
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

class CodeTextField extends StatelessWidget{
  final TextEditingController controller;

  const CodeTextField({Key? key,
    required this.controller,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintStyle:const TextStyle(color:Colors.black38),
          hintText:"0" ,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:const BorderSide(
              color: Colors.black38,
            ),
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:const BorderSide(
                color: Colors.black38,
                width: 1
            ),
          ),
          filled: true,
          fillColor:cusWhite ,
      ),
    );
  }
}