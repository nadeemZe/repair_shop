import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
  final String? messageSender;
  final String? message;

  MessagesModel({
   this.messageSender,
   this.message
  });
}


   Stream<List<MessagesModel>>getMessages(uid) {
      List<MessagesModel> messagesList=[];

       FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots().map((DocumentSnapshot document){
          print('fuck u');
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        var messages = data['messages'];

        for(int i=0; i<messages.length; i++) {
         MessagesModel messagesModel=MessagesModel(
           messageSender :messages[i]['message_sender'],
           message : messages[i]['message'],
         );
         messagesList.add(messagesModel);
        }
        });
      return Stream.value(messagesList);
  }



