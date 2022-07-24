class SuperChat {
  String? cmd;
  Data? data;

  SuperChat({this.cmd, this.data});

  SuperChat.fromJson(Map<String, dynamic> json) {
    cmd = json['cmd'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cmd'] = this.cmd;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? roomId;
  int? uid;
  String? uname;
  String? uface;
  int? messageId;
  String? message;
  String? msgId;
  int? rmb;
  int? timestamp;
  int? startTime;
  int? endTime;
  int? guardLevel;
  int? fansMedalLevel;
  String? fansMedalName;
  bool? fansMedalWearingStatus;

  Data(
      {this.roomId,
      this.uid,
      this.uname,
      this.uface,
      this.messageId,
      this.message,
      this.msgId,
      this.rmb,
      this.timestamp,
      this.startTime,
      this.endTime,
      this.guardLevel,
      this.fansMedalLevel,
      this.fansMedalName,
      this.fansMedalWearingStatus});

  Data.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    uid = json['uid'];
    uname = json['uname'];
    uface = json['uface'];
    messageId = json['message_id'];
    message = json['message'];
    msgId = json['msg_id'];
    rmb = json['rmb'];
    timestamp = json['timestamp'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    guardLevel = json['guard_level'];
    fansMedalLevel = json['fans_medal_level'];
    fansMedalName = json['fans_medal_name'];
    fansMedalWearingStatus = json['fans_medal_wearing_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['uface'] = this.uface;
    data['message_id'] = this.messageId;
    data['message'] = this.message;
    data['msg_id'] = this.msgId;
    data['rmb'] = this.rmb;
    data['timestamp'] = this.timestamp;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['guard_level'] = this.guardLevel;
    data['fans_medal_level'] = this.fansMedalLevel;
    data['fans_medal_name'] = this.fansMedalName;
    data['fans_medal_wearing_status'] = this.fansMedalWearingStatus;
    return data;
  }
}
