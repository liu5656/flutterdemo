import 'package:flutter_shop/pages/shopping/Model/product.dart';
import 'package:flutter_shop/component/segment.dart';

class Menu implements SegmentProtocol{
  String name;
  String id;
  int pageNo = 1;
  int pageSize = 10;
  List<Product> products = [];

  Menu({this.id, this.name});
  factory Menu.fromJson(Map<String, dynamic> json) {
    Menu m = Menu(id: json["enumItemValue"], name: json["enumItemName"]);
    m.title = m.name;
    return m;
  }

  @override
  String title;
} 