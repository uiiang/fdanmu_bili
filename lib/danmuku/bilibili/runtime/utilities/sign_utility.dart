import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';
import 'package:sortedmap/sortedmap.dart';

class SignUtility {
  /// <summary>
  /// 开放平台的access_key_secret，请妥善保管以防泄露
  /// </summary>
  static String accessKeySecret = "";

  /// <summary>
  /// 开放平台的access_key_id，请妥善保管以防泄露
  /// </summary>
  static String accessKeyId = "";

  /// <summary>
  /// 应用的唯一标识。在OAuth2.0认证过程中，client_id的值即为oauth_consumer_key的值。请妥善保管以防泄露
  /// </summary>
  static String clientId = "";

  /// <summary>
  /// 对应的密钥，访问用户资源时用来验证应用的合法性。在OAuth2.0认证过程中，secret的值即为oauth_consumer_secret的值。请妥善保管以防泄露
  /// </summary>
  static String secret = "";
  static Map<String, String> setReqHeader(String jsonParam, String cookie) {
    Map<String, String> sortDic = orderAndMd5(jsonParam);
    String auth = calculateSignature(sortDic);
    // sortDic.forEach((key, value) {});
    sortDic["Authorization"] = auth;
    sortDic["Accept"] = "application/json";
    sortDic["Content-Type"] = "application/json";
    if (cookie.isNotEmpty) {
      sortDic["Cookie"] = cookie;
    }
    // var bytes = utf8.encode(jsonParam).toList();
    return sortDic;
  }

  static Map<String, String> orderAndMd5(String jsonParam) {
    var keyValuePairs = <String, String>{};

    keyValuePairs["x-bili-content-md5"] = Md5(jsonParam);

    keyValuePairs["x-bili-timestamp"] =
        (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    //1656679135
    //1656679914.583
    keyValuePairs["x-bili-signature-method"] = "HMAC-SHA256";
    keyValuePairs["x-bili-signature-nonce"] = const Uuid().v1().toString();
    keyValuePairs["x-bili-accesskeyid"] = accessKeyId;
    keyValuePairs["x-bili-signature-version"] = "1.0";
    // keyValuePairs.forEach((key, value) {
    //   Log.i("before sort key:$key, value:$value");
    // });
    Map<String, String> sortDic = SortedMap(const Ordering.byKey());
    sortDic.addAll(keyValuePairs);

    // sortDic.forEach((key, value) {
    //   Log.i("after sort key:$key, value:$value");
    // });
    // .OrderBy(x => x.Key).ToDictionary(x => x.Key, x => x.Value);
    return sortDic;
  }

  static String Md5(String source) {
    // print("Md5 source:$source");
    //需要将字符串转成字节数组
    var bytes = utf8.encode(source);
    //加密后是一个字节类型的数组，这里要注意编码UTF8/Unicode等的选择
    var digest = md5.convert(bytes);
    //转成字符串
    var retmd5 = md5.convert(utf8.encode(source)).toString();
    // print("Md5 retmd5:$retmd5");
    return retmd5;
  }

  static String calculateSignature(Map<String, String> keyValuePairs) {
    var sig = "";
    keyValuePairs.forEach((key, value) {
      // sig += key + "=" + value + "&";
      // print("calculateSignature key: $key, value: $value");
      if (sig.length < 1) {
        sig += "$key:$value";
      } else {
        sig += "\n$key:$value";
      }
    });
    // print("calculateSignature sig: $sig");
    return hmacSHA256(sig, accessKeySecret);
  }

  static String hmacSHA256(String message, String secret) {
    // print("hmacSHA256 message: $message, secret: $secret");
    // secret ??= "";
    // var encoding = new UTF8Encoding();
    List<int> keyByte = utf8.encode(secret);
    List<int> messageBytes = utf8.encode(message);
    Hmac hash256 = Hmac(sha256, keyByte);
    List<int> hash = hash256.convert(messageBytes).bytes;
    var builder = StringBuffer();
    for (var element in hash) {
      //左侧补0
      String v = element.toRadixString(16).padLeft(2, '0');
      // print("hmacSHA256 element: $element v: $v");
      //element转换为大写16进制
      builder.write(v);
    }

    return builder.toString();
  }
}
