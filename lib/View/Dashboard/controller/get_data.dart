import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/models/info_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProviderData {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Stream<List<UserInfoData>> get otherUsers {
    return FirebaseFirestore.instance
        .collection('user')
        .where('userId', isNotEqualTo: userId) // Exclude the current user
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => UserInfoData.fromMap(doc.data()))
              .toList(),
        );
  }
}

class CurrentUSerData {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Stream<List<UserInfoData>> get verifydata {
    return FirebaseFirestore.instance
        .collection('user')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => UserInfoData.fromMap(doc.data()))
              .toList(),
        );
  }
}
