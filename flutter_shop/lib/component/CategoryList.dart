import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {

  List<CategoryListDelegate> items;
  CategoryList({Key key, this.items}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.items.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index){
        return Center(
          child: Column(
            children: <Widget>[
              Image.network(widget.items[index].img, width: 50, height: 50),
                  Text(widget.items[index].title)
            ],
          ),
        );
      },
    );
  }
}

class CategoryListDelegate {
  String title;
  String img;
}

