class Gift {
  String? cmd;
  Data? data;

  Gift({this.cmd, this.data});

  Gift.fromJson(Map<String, dynamic> json) {
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
  int? giftId;
  String? giftName;
  int? giftNum;
  int? price;
  bool? paid;
  int? fansMedalLevel;
  String? fansMedalName;
  bool? fansMedalWearingStatus;
  int? guardLevel;
  int? timestamp;
  String? msgId;
  AnchorInfo? anchorInfo;

  Data(
      {this.roomId,
      this.uid,
      this.uname,
      this.uface,
      this.giftId,
      this.giftName,
      this.giftNum,
      this.price,
      this.paid,
      this.fansMedalLevel,
      this.fansMedalName,
      this.fansMedalWearingStatus,
      this.guardLevel,
      this.timestamp,
      this.msgId,
      this.anchorInfo});

  Data.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    uid = json['uid'];
    uname = json['uname'];
    uface = json['uface'];
    giftId = json['gift_id'];
    giftName = json['gift_name'];
    giftNum = json['gift_num'];
    price = json['price'];
    paid = json['paid'];
    fansMedalLevel = json['fans_medal_level'];
    fansMedalName = json['fans_medal_name'];
    fansMedalWearingStatus = json['fans_medal_wearing_status'];
    guardLevel = json['guard_level'];
    timestamp = json['timestamp'];
    msgId = json['msg_id'];
    anchorInfo = json['anchor_info'] != null
        ? new AnchorInfo.fromJson(json['anchor_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['uface'] = this.uface;
    data['gift_id'] = this.giftId;
    data['gift_name'] = this.giftName;
    data['gift_num'] = this.giftNum;
    data['price'] = this.price;
    data['paid'] = this.paid;
    data['fans_medal_level'] = this.fansMedalLevel;
    data['fans_medal_name'] = this.fansMedalName;
    data['fans_medal_wearing_status'] = this.fansMedalWearingStatus;
    data['guard_level'] = this.guardLevel;
    data['timestamp'] = this.timestamp;
    data['msg_id'] = this.msgId;
    if (this.anchorInfo != null) {
      data['anchor_info'] = this.anchorInfo!.toJson();
    }
    return data;
  }
}

class AnchorInfo {
  int? uid;
  String? uname;
  String? uface;

  AnchorInfo({this.uid, this.uname, this.uface});

  AnchorInfo.fromJson(Map<String, dynamic> json) {
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
