class AppStartInfo {
  int? code;
  String? message;
  String? requestId;
  Data? data;

  AppStartInfo({this.code, this.message, this.requestId, this.data});

  AppStartInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    requestId = json['request_id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['request_id'] = this.requestId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  AnchorInfo? anchorInfo;
  GameInfo? gameInfo;
  WebsocketInfo? websocketInfo;

  Data({this.anchorInfo, this.gameInfo, this.websocketInfo});

  Data.fromJson(Map<String, dynamic> json) {
    anchorInfo = json['anchor_info'] != null
        ? new AnchorInfo.fromJson(json['anchor_info'])
        : null;
    gameInfo = json['game_info'] != null
        ? new GameInfo.fromJson(json['game_info'])
        : null;
    websocketInfo = json['websocket_info'] != null
        ? new WebsocketInfo.fromJson(json['websocket_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.anchorInfo != null) {
      data['anchor_info'] = this.anchorInfo!.toJson();
    }
    if (this.gameInfo != null) {
      data['game_info'] = this.gameInfo!.toJson();
    }
    if (this.websocketInfo != null) {
      data['websocket_info'] = this.websocketInfo!.toJson();
    }
    return data;
  }
}

class AnchorInfo {
  int? roomId;
  String? uface;
  int? uid;
  String? uname;

  AnchorInfo({this.roomId, this.uface, this.uid, this.uname});

  AnchorInfo.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    uface = json['uface'];
    uid = json['uid'];
    uname = json['uname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_id'] = this.roomId;
    data['uface'] = this.uface;
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    return data;
  }
}

class GameInfo {
  String? gameId;

  GameInfo({this.gameId});

  GameInfo.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    return data;
  }
}

class WebsocketInfo {
  String? authBody;
  List<String>? wssLink;

  WebsocketInfo({this.authBody, this.wssLink});

  WebsocketInfo.fromJson(Map<String, dynamic> json) {
    authBody = json['auth_body'];
    wssLink = json['wss_link'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_body'] = this.authBody;
    data['wss_link'] = this.wssLink;
    return data;
  }
}
