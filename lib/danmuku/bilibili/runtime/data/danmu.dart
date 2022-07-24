class Danmu {
  String? cmd;
  Data? data;

  Danmu({this.cmd, this.data});

  Danmu.fromJson(Map<String, dynamic> json) {
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
  String? msg;
  String? msgId;
  int? fansMedalLevel;
  String? fansMedalName;
  bool? fansMedalWearingStatus;
  int? guardLevel;
  int? timestamp;
  String? uface;
  int? score;

  Data(
      {this.roomId,
      this.uid,
      this.uname,
      this.msg,
      this.msgId,
      this.fansMedalLevel,
      this.fansMedalName,
      this.fansMedalWearingStatus,
      this.guardLevel,
      this.timestamp,
      this.uface,
      this.score});

  Data.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    uid = json['uid'];
    uname = json['uname'];
    msg = json['msg'];
    msgId = json['msg_id'];
    fansMedalLevel = json['fans_medal_level'];
    fansMedalName = json['fans_medal_name'];
    fansMedalWearingStatus = json['fans_medal_wearing_status'];
    guardLevel = json['guard_level'];
    timestamp = json['timestamp'];
    uface = json['uface'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['msg'] = this.msg;
    data['msg_id'] = this.msgId;
    data['fans_medal_level'] = this.fansMedalLevel;
    data['fans_medal_name'] = this.fansMedalName;
    data['fans_medal_wearing_status'] = this.fansMedalWearingStatus;
    data['guard_level'] = this.guardLevel;
    data['timestamp'] = this.timestamp;
    data['uface'] = this.uface;
    data['score'] = this.score;
    return data;
  }
}
