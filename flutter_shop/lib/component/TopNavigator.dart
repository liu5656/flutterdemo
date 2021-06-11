import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';

class CategoryNavigator extends StatefulWidget {
  CategoryNavigator({Key key}) : super(key: key);
  @override
  _CategoryNavigatorState createState() => _CategoryNavigatorState();
}

class _CategoryNavigatorState extends State<CategoryNavigator> {
  var count = 0;
  List items;

  @override
  void initState() {
    getCategoryList().then((response) {
      setState(() {
        items = (response["result"] as List);
        count = items.length;
      });
    });
    super.initState();
  }

  Widget _gridViewTest() {
    return SizedBox(
        height: 195,
        child: GridView.builder(
          padding: EdgeInsets.only(top: 15, left: 0, right: 15),
          scrollDirection: Axis.horizontal,
          itemCount: count,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            var temp = items[index];
            return SizedBox(
              width: 50,
              height: 80,
              child: Column(
                children: <Widget>[
                  Image.network(temp["img"], width: 50, height: 50),
                  Text(temp["title"])
                ],
              ),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _gridViewTest();
  }
}
