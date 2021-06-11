import 'package:flutter/material.dart';
import 'package:flutter_shop/component/refresh/Refresh.dart';
import 'package:flutter_shop/pages/shopping/View/ProductCellView.dart';
import 'package:flutter_shop/pages/shopping/Model/Menu.dart';

class ProductListView extends StatefulWidget {
  final callback;
  final tapCallback;
  Menu menu;

  ProductListView({Key key, this.menu, this.callback, this.tapCallback}) : super(key: key);
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {

  var itemHeight = 150.0;

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: widget.menu.products.length,
        itemExtent: itemHeight,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index > 0 && index == widget.menu.products.length - 1 ) { // 展示最后一条

            widget.callback(RefreshType.more, widget.menu); // 服务器获取数据
            return Container(
              padding: const EdgeInsets.only(top: 16),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          }else{
            var temp = widget.menu.products[index];
            return ProductCellView(product: temp, tapCallback: widget.tapCallback);
          }
        },
      );
  }
}
