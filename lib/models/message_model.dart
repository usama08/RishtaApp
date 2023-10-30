class MessageModel {
  String? sentby;
  String? dateTime;
  String? msg;

  MessageModel({this.msg, this.dateTime, this.sentby});

  MessageModel.fromMap(Map<dynamic, dynamic> map) {
    sentby = map["sentby"];
    dateTime = map["dateTime"];
    msg = map["message"];
  }

  Map<String, dynamic> toMap() {
    return {
      "sentby": sentby,
      "message": msg,
      "dateTime": dateTime,
    };
  }
}
