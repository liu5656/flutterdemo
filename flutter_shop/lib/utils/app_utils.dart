import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static SSSlaunch(String url) async {
    if (url == null || url.length == 0) {return;}
    if (await canLaunch(url)) {
      print("jump url " + url);
      await launch(url);
    }else{
      print("jump fail " + url);
    }
  }
}