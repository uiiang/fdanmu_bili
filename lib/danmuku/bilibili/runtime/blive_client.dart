import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fdanmu_bili/danmuku/bilibili/bili_define.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/BApi.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/app_start_info.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/codec.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/danmu.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/gift.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/guard.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/super_chat.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/super_chat_del.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef ReceiveDanmakuEvent = void Function(Danmu danmu);
typedef ReceiveGiftEvent = void Function(Gift gift);
typedef ReceiveGuardBuyEvent = void Function(Guard guard);
typedef ReceiveSuperChatEvent = void Function(SuperChat e);
typedef ReceiveSuperChatDelEvent = void Function(SuperChatDel e);

class BLiveClient {
  String wssUrl = "";
  String token = "";
  int realRoomId = 0;
  WebSocketChannel? ws;
  Timer? heartbeater;

  ReceiveDanmakuEvent? onDanmaku;
  ReceiveGiftEvent? onGift;
  ReceiveGuardBuyEvent? onGuardBuy;
  ReceiveSuperChatEvent? onSuperChat;
  ReceiveSuperChatDelEvent? onSuperChatDel;

  void onMessage(BliveMessage m) {
    switch (m.op) {
      case BliveOps.message:
        {
          final j = json.decode(m.body);
          switch (j["cmd"]) {
            case BiliDefine.LIVE_OPEN_PLATFORM_DM:
              onDanmaku?.call(Danmu.fromJson(j));
              break;
            case BiliDefine.LIVE_OPEN_PLATFORM_SEND_GIFT:
              onGift?.call(Gift.fromJson(j));
              break;
            case BiliDefine.LIVE_OPEN_PLATFORM_GUARD:
              onGuardBuy?.call(Guard.fromJson(j));
              break;
            case BiliDefine.LIVE_OPEN_PLATFORM_SUPER_CHAT:
              onSuperChat?.call(SuperChat.fromJson(j));
              break;
            case BiliDefine.LIVE_OPEN_PLATFORM_SUPER_CHAT_DEL:
              onSuperChatDel?.call(SuperChatDel.fromJson(j));
              break;
            default:
              break;
          }
          break;
        }
      default:
        break;
    }
  }

  Future<String> connect(String code, String appId) async {
    String resp = await BApi.startInteractivePlay(code, appId);
    AppStartInfo room = AppStartInfo.fromJson(json.decode(resp));
    String gameId = room.data!.gameInfo!.gameId!;
    wssUrl = room.data!.websocketInfo!.wssLink!.first;
    token = room.data!.websocketInfo!.authBody!;
    realRoomId = room.data!.anchorInfo!.roomId!;
    ws = IOWebSocketChannel.connect(Uri.parse(wssUrl));

    ws?.stream.listen((message) {
      final ms = decode(message);
      for (BliveMessage m in ms) {
        onMessage(m);
      }
    });
    ws?.sink.add(encode2(BliveOps.userAuth, msg: token));
    // set heartbeat timer
    heartbeater = Timer.periodic(const Duration(seconds: 30), (timer) {
      ws?.sink.add(encode(BliveOps.heartbeat, ""));
    });
    return gameId;
  }

  Future<void> disconnect(String gameId, String appId) async {
    await BApi.endInteractivePlay(gameId, appId);
    close();
  }

  void close() {
    heartbeater?.cancel();
    heartbeater = null;
    ws?.sink.close();
    ws = null;
    // danmus.clear();
    // superChats.clear();
  }
}
