import 'package:flutter_shop/component/CategoryList.dart';

class CategoryModel implements CategoryListDelegate{
  String type;
  String url;

  @override
  String title;
  String img;

  CategoryModel({this.type, this.url, this.title, this.img});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    CategoryModel m = CategoryModel(type: json["type"], url: json["url"], title: json["title"], img: json["img"]);
    return m;
  }
} 