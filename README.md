bilibili弹幕库Dart版

## Features

  - 使用B站官方API获取弹幕信息
  - 连接B站直接间
  - 获取弹幕及发送弹幕用户信息
  - 断开房间连接

## Getting started

  - 能过https://open-live.bilibili.com/ 申请互动游戏权限
  - 在`pubspec.yaml`中添加依赖

## Usage
  ### 方法一
  - 需自行维护心跳
  - `SignUtility.accessKeySecret`和`SignUtility.accessKeyId`需要替换为自己的
  - `BApi.startInteractivePlay` 连接房间
  - `BApi.endInteractivePlay` 断开房间
  - `BApi.heartBeatInteractivePlay` 心跳

  ### 方法二
  - 自动维护心跳
  ```dart
  import 'package:bilibili_danmaku/blive_client.dart';

  final BLiveClient _client = BLiveClient();
  gameId = await _client.connect();
  _client.onDanmaku = (danmu) =>
        {log.i("弹幕:${danmu.toJson()}")};//监听弹幕
  ```

 ## 依赖
  - web_socket_channel: ^2.2.0 # websocket网络
  - uuid: ^3.0.0 #生成uid
  - sortedmap: ^0.5.1 # map排序
  - crypto: ^3.0.0 # 加密
  - dio: ^4.0.6 # 网络请求