import 'package:flutter/material.dart';
import 'package:shop_repair/constant/helpers.dart';
import 'package:shop_repair/controllers/app_state_controller.dart';
//import 'package:shop_repair/models/message_model.dart';
import 'package:shop_repair/widgets/custom_app_bar.dart';
import 'package:shop_repair/widgets/custom_bottom_navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Messages extends StatefulWidget{
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  final TextEditingController _messageController= TextEditingController();
  final ScrollController _scrollController=ScrollController();

  CollectionReference<Map<String,dynamic>> users = FirebaseFirestore.instance.collection('users');

  Future<void> sendMessage() {
    return users.doc(AppState.uid).set({
           'messages':FieldValue.arrayUnion([{'message_sender': 'u',
                       'message': _messageController.text,
                      }])
           },
            SetOptions(merge: true),
     )
        .then((value) => _animateToLast())
        .catchError((error) => print("Failed to add message: $error"));
  }

  //animate to max scroll to focus on last item in listview
  _animateToLast() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
    _messageController.text='';
  }

  @override
  void initState(){
    super.initState();
    //getMessages(docId);
  }

  @override
  void dispose(){
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: CustomAppBar()),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
                stream:users.doc(AppState.uid).snapshots(),
                builder: (_, AsyncSnapshot <DocumentSnapshot<Map<String,dynamic>>> snapshot) {
                  if (snapshot.hasError) return Text('Error = ${snapshot.error}',style:const TextStyle(color: Colors.deepOrangeAccent),);

                  if (snapshot.hasData) {
                    //after firestore update you need to
                    //add type DocumentSnapshot<Map<String,dynamic>>
                    var output = snapshot.data! ;
                    var messagesList = output['messages'];
                    return SizedBox(
                      height: getHeight(context)/2.7,
                      width: getWidth(context),
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        itemCount:messagesList.length,
                        itemBuilder: (context,index) {
                          return Align(
                            alignment:(messagesList[index]['message_sender']=='u')
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            child: Container(
                                width: getWidth(context)/2,
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(bottom: 12),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      side:  BorderSide(
                                          color: (messagesList[index]['message_sender']=='u')?cusBlue:Colors.deepOrangeAccent
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topRight: (messagesList[index]['message_sender']=='u')?const Radius.circular(0):const Radius.circular(12),
                                        topLeft:(messagesList[index]['message_sender']=='u')?const Radius.circular(12):const Radius.circular(0),
                                        bottomLeft: const Radius.circular(12),
                                        bottomRight: const Radius.circular(12),
                                      )
                                  ),
                                ),
                                child: Text(messagesList[index]['message'])),
                          );
                        }
                      ),
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(
                height: getHeight(context)/25,
              ),
              TextFormField(
                controller: _messageController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle:const TextStyle(color:Colors.black38),
                  hintText:"Type message here" ,
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
                  prefixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    icon:const Icon(Icons.attach_file,color: Colors.black38,),
                  ),
                  suffixIcon:IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      sendMessage();
                    },
                    icon:const Icon(Icons.send,color: cusBlue,),
                  ) ,
                  filled: true,
                  fillColor:cusWhite ,
                ),
              ),
              const SizedBox(height: 35,),
              SizedBox(
                height: getHeight(context)/7,
                width: getHeight(context)/5,
                child: Image.asset(logo,),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:const CustomNavigationBar(),
    );
  }
}