import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/ColorEx.dart';

class UpImgDownTitleButton extends StatefulWidget {
  String img;
  String title;
  double width;
  UpImgDownTitleButton({Key key, this.img, this.title, this.width}) : super(key: key);

  @override
  _UpImgDownTitleButtonState createState() => _UpImgDownTitleButtonState();
}

class _UpImgDownTitleButtonState extends State<UpImgDownTitleButton> {
  @override
  Widget build(BuildContext context) {
    


    return Column(
      children: <Widget>[
        Container(
          width: widget.width,
          child: Image.asset(widget.img),
        ),
        SizedBox(height: 6),
        Text(widget.title, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: ColorUtil.hexColor(0x282828)))
      ]
    );
  }
}