import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/encrypted/md5.dart';
import 'package:dio/src/adapters/io_adapter.dart';

Future getHomePageContent(String type) async {
  var params = {"platform": "ios", "type": type};
  return post(API.banner, params);
}
Future getMenu() async {
  var params = {"enumClassName": "HDKProductCategory"};
  return post(API.menu, params);
}
Future getCategoryList() async {
  var params = {"type": "homeIcon"};
  return post(API.category, params);
}
Future getCommonProductList(String key, int pageNo, int pageSize, String id) async {
  var params = {"keyWord": key, "pageSize": pageSize, "pageNo": pageNo, "optId": id};
  return post(API.menuData, params);
}
Future getSalesProductList() {
  var params = {"pageSize": "homeIcon", "pageNo": 1, "saleType": 2};
  return post(API.category, params);
}

Future requestProductInfo(String goodsId, String platform) {
  var params = {"goodsId": goodsId, "platform": platform};
  return post(API.product, params);
}


Future post(String url, Map<String, dynamic> params) async {
  try {
    var req = Dio();
     req.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();

    (req.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (url) {
        return 'PROXY 192.168.0.69:8888';
      };
    };

    var temp = sign(params);
    var res = await req.post(url, data: temp);
    if (res.statusCode == 200) {
      return res.data;
    } else {
      print(('url:' + url + "\nerror:" + res.data.message.toString()));
    }
  } catch (e) {
    print('url:' + url + "\nerror:" + e.toString());
  }
}

sign(params) {
  params['sign'] = generatedMd5(sortKey(params)).toUpperCase();
  return params;
}

const token = "8169c859a5cc463ab2918cf64c8b8f7f";
sortKey(Map<String, dynamic> params) {
  var keys = params.keys.toList();
  keys.sort((left, right) => left.compareTo(right));
  var str = "";
  keys.forEach((key) {
    str = str + key + params[key].toString();
  });
  str = token + str + token;
  return str;
}
