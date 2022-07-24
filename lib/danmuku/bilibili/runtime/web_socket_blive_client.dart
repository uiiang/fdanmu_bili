// import 'dart:io';

// import 'package:fdanmu_bili/danmuku/bilibili/runtime/blive_client.dart';
// import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/app_start_info.dart';

// class WebSocketBLiveClient extends BLiveClient {
//   /// <summary>
//   ///  wss 长连地址
//   /// </summary>
//   List<String>? wssLink;

//   WebSocket? ws;

//   WebSocketBLiveClient(AppStartInfo appStartInfo) {
//     var websocketInfo = appStartInfo.data?.websocketInfo;
//     wssLink = websocketInfo?.wssLink!;
//     token = websocketInfo?.authBody;
//   }

//   @override
//   void connect() {
//     var url = wssLink?.first;
//     if (url == null) {
//       throw Exception("wsslink is invalid");
//     }

//     if (ws != null && ws?.readyState != WebSocket.closed) {
//       ws?.close();
//     }
//     ws = new WebSocket(url);
//   }

//   @override
//   void disconnect() {
//     // TODO: implement disconnect
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//   }
// }
