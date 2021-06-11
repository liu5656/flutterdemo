import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/ColorEx.dart';


class UserEstimateItem extends StatefulWidget {
  String title;
  String detail;
  UserEstimateItem({Key key, this.title, this.detail}) : super(key: key);

  @override
  _UserStatisItemState createState() => _UserStatisItemState();
}

class _UserStatisItemState extends State<UserEstimateItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(widget.title, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: ColorUtil.hexColor(0x999999))),
        SizedBox(height: 2),
        Text(widget.detail, style: TextStyle(color: ColorUtil.hexColor(0xE6E6E6), fontWeight: FontWeight.bold, fontSize: 14))
      ],
    );
  }
}

class UserEstimate extends StatefulWidget {
  UserEstimate({Key key}) : super(key: key);

  @override
  _UserEstimateState createState() => _UserEstimateState();
}

class _UserEstimateState extends State<UserEstimate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left:10, right:10),
      height: 109,
      decoration: BoxDecoration(
        color: ColorUtil.hexColor(0x312A26),
        border: Border.all(color: ColorUtil.hexColor(0x484848), width: 0.5),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget>[
              UserEstimateItem(title: "今日预估", detail: "¥1254.054"),
              UserEstimateItem(title: "今日预估", detail: "¥1254.054"),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              UserEstimateItem(title: "今日预估", detail: "¥1254.054"),
              UserEstimateItem(title: "今日预估", detail: "¥1254.054"),
            ]
          ),
        ]
        ),
    );
  }
}



