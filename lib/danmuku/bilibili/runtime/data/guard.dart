class Guard {
  String? cmd;
  Data? data;

  Guard({this.cmd, this.data});

  Guard.fromJson(Map<String, dynamic> json) {
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
  UserInfo? userInfo;
  int? guardLevel;
  int? guardNum;
  String? guardUnit;
  int? fansMedalLevel;
  String? fansMedalName;
  bool? fansMedalWearingStatus;
  int? timestamp;
  int? roomId;
  String? msgId;

  Data(
      {this.userInfo,
      this.guardLevel,
      this.guardNum,
      this.guardUnit,
      this.fansMedalLevel,
      this.fansMedalName,
      this.fansMedalWearingStatus,
      this.timestamp,
      this.roomId,
      this.msgId});

  Data.fromJson(Map<String, dynamic> json) {
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    guardLevel = json['guard_level'];
    guardNum = json['guard_num'];
    guardUnit = json['guard_unit'];
    fansMedalLevel = json['fans_medal_level'];
    fansMedalName = json['fans_medal_name'];
    fansMedalWearingStatus = json['fans_medal_wearing_status'];
    timestamp = json['timestamp'];
    roomId = json['room_id'];
    msgId = json['msg_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    data['guard_level'] = this.guardLevel;
    data['guard_num'] = this.guardNum;
    data['guard_unit'] = this.guardUnit;
    data['fans_medal_level'] = this.fansMedalLevel;
    data['fans_medal_name'] = this.fansMedalName;
    data['fans_medal_wearing_status'] = this.fansMedalWearingStatus;
    data['timestamp'] = this.timestamp;
    data['room_id'] = this.roomId;
    data['msg_id'] = this.msgId;
    return data;
  }
}

class UserInfo {
  int? uid;
  String? uname;
  String? uface;

  UserInfo({this.uid, this.uname, this.uface});

  UserInfo.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    uname = json['uname'];
    uface = json['uface'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['uface'] = this.uface;
    return data;
  }
}
