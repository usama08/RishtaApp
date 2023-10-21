class ChatRoomModel {
  String? chatroomid;
  String? dateTime;

  ChatRoomModel({
    this.chatroomid,
    this.dateTime,
  });

  ChatRoomModel.fromMap(Map<dynamic, dynamic> map) {
    chatroomid = map["chatroomid"];
    dateTime = map["dateTime"];
  }

  Map<String, dynamic> toMap() {
    return {
      "chatroomid": chatroomid,
      "dateTime": dateTime,
    };
  }
}
