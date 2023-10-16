import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyrishta/models/info_list.dart';

Future<UserInfoData?> getAboutYourselfData(String userId) async {
  try {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('user').doc(userId).get();

    if (documentSnapshot.exists) {
      return UserInfoData.fromJson(
          documentSnapshot.data() as Map<String, dynamic>);
    } else {
      return null; // Document doesn't exist
    }
  } catch (e) {
    print('Error fetching AboutYourself data: $e');
    return null;
  }
}
