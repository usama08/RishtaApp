class ChatRoomModel {
  String? chatroomid;
  String? dateTime;
  String? username;
  String? image;
  ChatRoomModel({
    this.chatroomid,
    this.dateTime,
    this.username,
    this.image,
  });

  ChatRoomModel.fromMap(Map<dynamic, dynamic> map) {
    chatroomid = map["chatroomid"];
    dateTime = map["dateTime"];
    username = map['Firstname'];
    image = map['Image'];
  }

  Map<String, dynamic> toMap() {
    return {
      "chatroomid": chatroomid,
      "dateTime": dateTime,
      'Firstname': username,
      'Image': image,
    };
  }
}
