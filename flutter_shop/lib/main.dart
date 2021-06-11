import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shop/pages/index_page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  // debugPaintLayerBordersEnabled = true;
  // debugRepaintRainbowEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  final GlobalKey screenSize = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: rootPage()
    );
  }

  Widget rootPage() {
    return IndexPage();
  }
}

