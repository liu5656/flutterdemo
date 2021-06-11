import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shop/component/BannerWidget.dart';
import 'package:flutter_shop/pages/Mine/UserFunctions.dart';
import 'package:flutter_shop/pages/Mine/view/UserInfo.dart';
import 'package:flutter_shop/pages/Mine/Model/User.dart';
import 'package:flutter_shop/pages/Mine/view/UserEstimate.dart';
import 'package:flutter_shop/pages/Mine/view/user_income.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/utils/ColorEx.dart';


class MemberPage extends StatefulWidget {
  MemberPage({Key key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {

  double screenWidth = 375;
  List<String> banner = [];


  @override
  void initState() {
    getHomePageContent("noticeBanner").then((res){
      var result = res["result"] as List;
      var temp = result.map((value){
        return value["img"].toString();
      }).toList();
      setState(() {
        banner = temp;
      });
    });


    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    var user = Account();
    user.isLogin = true;
    user.userId = '12';
    user.rankTitle = '超级达人';
    user.nickName = '用户昵称';
    user.avatar =
        'https://cdn2.jianshu.io/shakespeare/_next/static/images/note_page_right_sidebar_ad2-cdb24be0bc9321958a33b818173248e4.jpg';
    user.inviteCode = '123456';

    var income = statis();
    income.title = "累计入账收益(元)";
    income.total = 0.12;
    income.withdrawal = 0.08;
    income.tip = "每月23日可提取上月入账收益";

    screenWidth = MediaQuery.of(context).size.width;
    return Column(children: <Widget>[
      Container(
        height: 332,
        width: screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorUtil.hexColor(0x3F3A39),
                  ColorUtil.hexColor(0x151515)
                ])),
        child: Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      UserInfo(user: user),
                      UserEstimate(),
                      UserIncome(incomeStatis: income)
                    ]),
                top: 30,
                height: 400,
                width: screenWidth,
              )
            ]),
      ),
      UserFunction(),
      Container(
        height: 64,
        margin: EdgeInsets.only(top: 16),
        child: BannerWidget(imgUrls: banner)
      )
    ]);
  }
}
