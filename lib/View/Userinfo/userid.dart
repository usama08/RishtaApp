import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/View/AdminSide/adminchat.dart';
import 'package:easyrishta/View/Dashboard/controller/get_data.dart';
import 'package:easyrishta/common/app_colors.dart';
import 'package:easyrishta/common/app_image.dart';
import 'package:easyrishta/models/chatroom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userId =
        FirebaseAuth.instance.currentUser!.uid; // Get the current user's ID

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User ID',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.BlackColor,
                fontFamily: 'Poppins-Bold',
                fontWeight: FontWeight.bold,
              ),
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.cover,
            ),
          ),
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('chatrooms').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final chatRoomDocs = snapshot.data?.docs;

              return ListView.builder(
                itemCount: chatRoomDocs?.length,
                itemBuilder: (context, index) {
                  final chatRoomData =
                      chatRoomDocs?[index].data() as Map<String, dynamic>;
                  final chatRoomModel = ChatRoomModel.fromMap(chatRoomData);

                  // Check if the chatroom involves the current user (yourself)
                  if (chatRoomModel.chatroomid != userId) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminChatScreen(
                                otherUserId:
                                    chatRoomModel.chatroomid.toString()),
                          ),
                        );
                      },
                      child: Container(
                        width: 378.w,
                        height: 78.h,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            chatRoomModel.image!.isEmpty
                                ? Container(
                                    width: 60.w,
                                    height: 40.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.infodemo),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 60.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(chatRoomModel.image!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            SizedBox(width: 16.w),
                            // Right side text
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${chatRoomModel.username}',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(); // Skip your own chatroom
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
