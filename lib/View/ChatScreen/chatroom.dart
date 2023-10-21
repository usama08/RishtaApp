import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/common/app_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../models/chatroom.dart';

class Message {
  final String text;
  final DateTime timestamp;

  Message(this.text) : timestamp = DateTime.now();
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
    }
  }

  lodingFalse() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;
  getdata() async {
    DateTime currentDateTime = DateTime.now();
    ChatRoomModel newChatRoom = ChatRoomModel(
      chatroomid: userId,
      dateTime: currentDateTime.toString(),
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
