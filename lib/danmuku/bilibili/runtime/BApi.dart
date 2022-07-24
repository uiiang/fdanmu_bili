import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fdanmu_bili/danmuku/bilibili/bili_define.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/utilities/sign_utility.dart';

class BApi {
  /// <summary>
  /// 是否为测试环境的api
  /// </summary>
  static bool isTestEnv = false;

  static String scheme = isTestEnv ? "http" : "https";

  /// <summary>
  /// 开放平台域名
  /// </summary>
  static String OpenLiveDomain =
      isTestEnv ? "test-live-open.biliapi.net" : "live-open.biliapi.com";

  /// <summary>
  /// 获取房间长号和短号
  /// </summary>
  static String k_RoomIdApi = "/v1/common/roomIdInfo";

  /// <summary>
  /// 应用开启
  /// </summary>
  static String k_InteractivePlayStart = "/v2/app/start";

  /// <summary>
  /// 应用关闭
  /// </summary>
  static String k_InteractivePlayEnd = "/v2/app/end";

  /// <summary>
  /// 应用心跳
  /// </summary>
  static String k_InteractivePlayHeartBeat = "/v2/app/heartbeat";

  /// <summary>
  /// 应用批量心跳
  /// </summary>
  static String k_InteractivePlayBatchHeartBeat = "/v2/app/batchHeartbeat";

  static Future<int> getRoomIdInfo(String roomId) async {
    int realRoomId = 0;
    var param = "{\"id\":$roomId}";
    realRoomId =
        (await _requestWebUTF8Post(scheme, OpenLiveDomain, k_RoomIdApi, param))
            as int;
    return realRoomId;
  }

  static Future<String> startInteractivePlay(String code, String appId) async {
    var param = "{\"code\":\"$code\",\"app_id\":$appId}";
    var response = await _requestWebUTF8Post(
        scheme, OpenLiveDomain, k_InteractivePlayStart, param);
    // print("startInteractivePlay response:$response");
    return response;
  }

  static Future<String> endInteractivePlay(String gameId, String appId) async {
    var param = "{\"app_id\":$appId,\"game_id\":\"$gameId\"}";
    var response = await _requestWebUTF8Post(
        scheme, OpenLiveDomain, k_InteractivePlayEnd, param);
    // print("endInteractivePlay response:$response");
    return response;
  }

  static Future<String> heartBeatInteractivePlay(String gameId) async {
    var param = "{\"game_id\":\"$gameId\"}";
    var response = await _requestWebUTF8Post(
        scheme, OpenLiveDomain, k_InteractivePlayHeartBeat, param);
    // print("heartBeatInteractivePlay response:$response");
    return response;
  }

  static Future<String> _requestWebUTF8Post(
      scheme, postUrl, path, param) async {
    var dio = Dio();
    Map<String, String> header = SignUtility.setReqHeader(param, "");
    Response response = await dio.post("$scheme://$postUrl$path",
        data: param, options: Options(headers: header));
    print("response body:$response");
    return response.toString();
  }
}
