import 'package:flutter/material.dart';
import 'package:flutter_shop/component/UpImgDownTitleButton.dart';
import 'package:flutter_shop/utils/ColorEx.dart';

class UserFunction extends StatefulWidget {
  UserFunction({Key key}) : super(key: key);

  @override
  _UserFunctionState createState() => _UserFunctionState();
}

class _UserFunctionState extends State<UserFunction> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 80, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 6, left: 10, bottom: 10),
                child: Text("我的功能",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.hexColor(0x282828)))),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    UpImgDownTitleButton(
                        img: "images/pro_ic_order@2x.png",
                        title: "我的订单",
                        width: 40),
                    UpImgDownTitleButton(
                        img: "images/pro_ic_money@2x.png",
                        title: "团队订单",
                        width: 40),
                    UpImgDownTitleButton(
                        img: "images/pro_ic_team@2x.png",
                        title: "我的团队",
                        width: 40),
                    UpImgDownTitleButton(
                        img: "images/pro_ic_share@2x.png",
                        title: "邀请好友",
                        width: 40),
                  ]),
            )
          ],
        ));
  }
}
