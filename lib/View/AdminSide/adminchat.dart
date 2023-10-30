import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/common/app_svg.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../models/chatroom.dart';
import '../../models/message_model.dart';

class Message {
  final String text;
  final DateTime timestamp;

  Message(this.text) : timestamp = DateTime.now();
}

class AdminChatScreen extends StatefulWidget {
  @override
  _AdminChatScreenState createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool isLoading = true;
  List<Message> messages = [];

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      Message message = Message(messageText);
      setState(() {
        messages.add(message);
      });
      _messageController.clear();
      print('Message Sent: $messageText');
      addmsg(messageText);
    }
  }

  lodingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  addmsg(String msgs) async {
    DateTime? timestamp;
    timestamp = DateTime.now();
    // Reference to the parent document
    final parentDocumentRef =
        FirebaseFirestore.instance.collection('chatrooms').doc(userId);

    // Reference to the subcollection
    final subcollectionRef = parentDocumentRef.collection('messages');

    // Query the subcollection
    final subcollectionSnapshot = await subcollectionRef.get();
    if (subcollectionSnapshot.docs.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('chatrooms')
          .doc(userId)
          .collection('messages')
        ..add({
          "sentby": userId,
          "message": msgs,
          "dateTime": timestamp.toString(),
        });
    } else {
      FirebaseFirestore.instance
          .collection('chatrooms')
          .doc(userId)
          .collection('messages')
          .doc();
      FirebaseFirestore.instance
          .collection('chatrooms')
          .doc(userId)
          .collection('messages')
        ..add({
          "sentby": userId,
          "message": msgs,
          "dateTime": timestamp.toString(),
        });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    getCurrentUser();
    super.initState();
  }

  ///////  Cureent user data  ///////////////
  UserInfoData? userInfoData;
  Future<void> getCurrentUser() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    if (userId != null) {
      DocumentSnapshot userDocument =
          await FirebaseFirestore.instance.collection('user').doc(userId).get();

      if (userDocument.exists) {
        // Populate the currentUser using the ChatRoomModel
        userInfoData =
            UserInfoData.fromMap(userDocument.data() as Map<String, dynamic>);
        setState(() {});
      }
      getdata();
    }
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;
  getdata() async {
    DateTime currentDateTime = DateTime.now();
    ChatRoomModel newChatRoom = ChatRoomModel(
      chatroomid: userId,
      dateTime: currentDateTime.toString(),
      username: userInfoData!.firstname.toString(),
      image: userInfoData!.imagePath.toString(),
    );
    await FirebaseFirestore.instance
        .collection("chatrooms")
        .limit(1)
        .get()
        .then((value) => {
              if (value.size == 0)
                {
                  FirebaseFirestore.instance
                      .collection('chatrooms')
                      .doc(userId)
                      .set(newChatRoom.toMap()),
                  lodingFalse(),
                }
              else
                {
                  FirebaseFirestore.instance
                      .collection("chatrooms")
                      .where('chatroomid', isEqualTo: userId)
                      .limit(1)
                      .get()
                      .then((value) => {
                            if (value.size == 0)
                              {
                                FirebaseFirestore.instance
                                    .collection('chatrooms')
                                    .doc(userId)
                                    .set(newChatRoom.toMap()),
                                lodingFalse(),
                              }
                            else
                              {
                                lodingFalse(),
                              }
                          }),
                  //userid in this chatroom

                  lodingFalse(),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Online Chat',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: AppColors.BlackColor,
              fontFamily: 'Poppins-Bold',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.BlackColor,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            AppImages.background, // Replace with your background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return ListTile(
                            title: Text(message.text),
                            subtitle: Text(
                              DateFormat('MMM d, hh:mm a')
                                  .format(message.timestamp),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Type a message',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _sendMessage,
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(right: 10),
                              child: SvgPicture.asset(AppSvgImages
                                  .sendbtn), // Replace with your SVG asset
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
