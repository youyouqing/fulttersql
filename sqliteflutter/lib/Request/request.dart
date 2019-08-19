import '../Request/http_util.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
// import '../LoginModel/subJect_model.dart';
import '../LoginModel/dictionModel.dart';
import 'dart:io';
var ip ;
typedef RequestCallBack<T> = void Function(T value);
// 内网ip //改获取内网的方法仅支持ios 
Future main() async {
  // 内网ip
  for (var interface in await NetworkInterface.list()) {
    for (var addr in interface.addresses) {
      print('----jshs----${addr.address}');
      ip = addr.address;
      return ip;
    }
  }
}
 requestAllData(Map<String,dynamic> params) async {

    HttpUtils http =  HttpUtils();
   
   var globalDict = Map<String, String>();
    globalDict['OS'] = '2';
    globalDict['IP'] = await main();
    globalDict['Token'] = '';

    Map<String, String> map = params;

    List<String> keys = map.keys.toList();
    // key排序
    keys.sort((a, b) {
      List<int> al = a.codeUnits;
      List<int> bl = b.codeUnits;
      for (int i = 0; i < al.length; i++) {
        if (bl.length <= i) return 1;
        if (al[i] > bl[i]) {
          return 1;
        } else if (al[i] < bl[i]) return -1;
      }
      return 0;
    });
    print('输入key--************$params****************************----$keys');//// 1cfdcefa4b5528977afec5a88349ea8b

     String signStr = '';
    for (var item in keys) {
      if(item == 'Token'){

      }else
      {
        signStr = signStr + params[item]+'^';
      }
    }
   
    String b =  signStr.substring(0,signStr.length-1)+ '9ol.)P:?3edc\$RFV5tgb';
    String sign = generateMd5(b);
    print('$sign--sd****************************************-sdsd---$b');
    globalDict['Sign'] = sign;


     var returnDic = Map<String, Map>();
     returnDic['Global'] = globalDict;
     returnDic['Query'] = params;

    var resp = await http.postRequest('https://api.xiekang.net/v16/100',params:params, error: (msg) {print('home subject--$msg');});
    print('resp-****************************************-$resp.data');
  //   Future<void> initPlatformState() async {
  //   String encryptedString = resp.data;
  //   String key = 'xk@12580';
  //   String iv = 'xk@12580';
  //   String decryptedString;
  //     // 解密
  //     decryptedString = await Cipher2.decryptAesCbc128Padding7(encryptedString, key, iv);
    
  //   print('decryptedString--$decryptedString');
  // }
    return resp == null || resp.data == null ? [] : (resp.data);
  }
    // md5 加密
String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  // 这里其实就是 digest.toString()
  return digest.toString();
}
void requestGetData(RequestCallBack requestCallBack,String pageIndex) async {

    HttpUtils http =  HttpUtils();
   
   var parameter = Map<String, String>();
    parameter["pageIndex"] = pageIndex;
    parameter["pageSize"] = '10';
    parameter["agencyId"] = '55';


    String signStr = pageIndex+'^'+"10"+"^"+"55"+"9ol.)P:?3edc\$RFV5tgb";
   
    String sign = generateMd5(signStr);
    print('$sign--sd****************************************-sdsd---$signStr');
  

    var resp = await http.getRequest('https://ws.xiekang.net/APIService.svc/SynchrodataAIODictionaryDetail?pageIndex=$pageIndex&pageSize=10&agencyId=55&sign=$sign');
    print('get-$resp.data--$resp.request----*-$resp');
    var resultList = resp.data['list'];



    List<Lists> listsubject_model = resultList.map<Lists>((item) => Lists.fromJson(item)).toList();

    print('get-$resultList--$listsubject_model----');
    requestCallBack(listsubject_model);
  }