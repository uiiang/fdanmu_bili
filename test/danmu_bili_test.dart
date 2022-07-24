import 'dart:convert';

import 'package:fdanmu_bili/danmuku/bilibili/runtime/BApi.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/data/app_start_info.dart';
import 'package:fdanmu_bili/danmuku/bilibili/runtime/utilities/sign_utility.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("测试连接房间", () async {
    //测试的密钥
    SignUtility.accessKeySecret = "FYMUpSQp9SkpoVCjpSr7sqlnTmLuk7";
    //测试的ID
    SignUtility.accessKeyId = "oWCYtmKxIjAHLJGZHMv6ggXE";
    var resp =
        await BApi.startInteractivePlay("BN669RQI016O0", "1656223082309");
    AppStartInfo room = AppStartInfo.fromJson(json.decode(resp));
    expect(0, room.code);
    expect("0", room.message);
    String? gameid = room.data?.gameInfo!.gameId;
    //暂停2秒
    await Future.delayed(const Duration(seconds: 2));
    // 断开房间
    String resp2 = await BApi.endInteractivePlay(gameid!, "1656223082309");
    // print("resp2:$resp2");
    Map<String, dynamic> respObj = json.decode(resp2);
    expect(0, respObj["code"]);
    expect("0", respObj["message"]);
  });
}
