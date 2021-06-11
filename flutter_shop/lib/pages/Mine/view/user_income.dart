import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/Mine/Model/User.dart';
import 'package:flutter_shop/utils/ColorEx.dart';

class UserIncome extends StatefulWidget {
  statis incomeStatis;

  UserIncome({Key key, this.incomeStatis}) : super(key: key);

  @override
  _UserIncomeState createState() => _UserIncomeState();
}

class _UserIncomeState extends State<UserIncome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138,
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorUtil.hexColor(0xE7CDAA),
                ColorUtil.hexColor(0xD7B180)
              ])),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_leftWidget(), _rightWeight()]),
    );
  }

  _leftWidget() {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 24),
            Text(widget.incomeStatis.title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
            SizedBox(height: 7),
            Text(widget.incomeStatis.total.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.hexColor(0x282828))),
            SizedBox(height: 6),
            SizedBox(
              width: 66,
              height: 15,
              child: FlatButton(
                onPressed: () {},
                padding: EdgeInsets.only(left: 0),
                color: ColorUtil.hexColor(0xC39D6B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5)),
                child: Text("收益详情",
                    style: TextStyle(
                        fontSize: 10,
                        color: ColorUtil.hexColor(0xFFE9C0),
                        fontWeight: FontWeight.normal)),
              ),
            ),
            SizedBox(height: 8),
            Text(widget.incomeStatis.tip,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: ColorUtil.hexColor(0x666666)))
          ]),
    );
  }

  _rightWeight() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        SizedBox(height: 24),
        Text("可提现(元)",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
        SizedBox(height: 4),
        Text(widget.incomeStatis.withdrawal.toString(),
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ColorUtil.hexColor(0x282828))),
        SizedBox(height: 8),
        FlatButton(
          onPressed: () {},
          child: Text("立即提现",
              style: TextStyle(
                  fontSize: 14,
                  color: ColorUtil.hexColor(0xDBB888),
                  fontWeight: FontWeight.normal)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: ColorUtil.hexColor(0x181818),
        ),
      ]),
    );
  }
}
