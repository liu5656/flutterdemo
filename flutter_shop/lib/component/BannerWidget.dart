import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerWidget extends StatefulWidget {
  List<String> imgUrls = [];

  BannerWidget({Key key, this.imgUrls}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(widget.imgUrls[index]);
        },
        itemCount: widget.imgUrls.length,
        autoplay: true,
      ),
    );
  }
}
