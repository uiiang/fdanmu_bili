class SuperChatDel {
  String? cmd;
  Data? data;

  SuperChatDel({this.cmd, this.data});

  SuperChatDel.fromJson(Map<String, dynamic> json) {
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
  List<int>? messageIds;
  String? msgId;

  Data({this.roomId, this.messageIds, this.msgId});

  Data.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    messageIds = json['message_ids'].cast<int>();
    msgId = json['msg_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['message_ids'] = this.messageIds;
    data['msg_id'] = this.msgId;
    return data;
  }
}
