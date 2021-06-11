import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/Mine/Model/User.dart';
import 'package:flutter_shop/utils/ColorEx.dart';
import 'package:flutter_shop/utils/app_info.dart';

// ignore: must_be_immutable
class UserInfo extends StatefulWidget {
  Account user;
  UserInfo({Key key, this.user}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        avatar(widget.user),
        Container(
          height: 80,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _title(),
                _applyExclusiveCode(),
                _inviteCode()
              ]),
        ),
      ],
    );
  }

  Widget avatar(Account user) {
    var avatar = user.isLogin
        ? NetworkImage(user.avatar)
        : AssetImage('images/avatar_default@2x.png');
    return Container(
      width: 60,
      height: 60,
      // margin: EdgeInsets.only(left: 12, top: 30 + AppInfo.safeTop, right: 12),
      margin: EdgeInsets.only(left: 12, top: 0, right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        image: DecorationImage(image: avatar),
      ),
    );
  }

  _title() {
    return Row(
      children: <Widget>[
        Text(widget.user.isLogin ? widget.user.nickName : '未登录',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        Container(
          height: 20,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: ColorUtil.hexColor(0x4E4E4E),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: <Widget>[
              Image.asset('images/symbol@2x.png', width: 9, height: 12),
              Text(widget.user.rankTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10))
            ],
          ),
        ),
      ],
    );
  }

  _applyExclusiveCode() {
    return Container(
      height: 18,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: ColorUtil.hexColor(0x3F3A39),
          border: Border.all(color: ColorUtil.hexColor(0xE8CFA0), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        Image.asset('images/key_grey@2x.png', width: 8, height: 10),
        Text('申请专属口令',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12))
      ]),
    );
  }

  _inviteCode() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Text(
            '邀请码：' + widget.user.inviteCode,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white),
          ),
          SizedBox(width: 5),
          Container(
            height: 15,
            width: 34,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              color: ColorUtil.hexColor(0xFFC85D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5)),
              child: Text('复制',
                  style: TextStyle(
                      color: ColorUtil.hexColor(0x333333),
                      fontWeight: FontWeight.normal,
                      fontSize: 10)),
              onPressed: () {
                print('复制邀请码');
              },
            ),
          ),
          SizedBox(width: 5),
          Image.asset('images/pro_ic_head_display@2x.png',width: 16, height: 12)
        ],
      ),
    );
  }
}
