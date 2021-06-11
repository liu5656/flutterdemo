import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/shopping/Model/product.dart';
import 'package:flutter_shop/utils/ColorEx.dart';

class ProductCellView extends StatefulWidget {
  var tapCallback;
  Product product;
  ProductCellView({Key key, this.product, this.tapCallback}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductCellView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tapAction,
        child: getItem(),
    );
  }
  _tapAction() {
    widget.tapCallback(widget.product);
  }


  Widget createAvatar(Product model) {
    return Container(
              width: 140,
              height: 140,
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(model.imageUrl ?? "", fit: BoxFit.cover),
              ));
  }
  Widget createTitle(Product model) {
    return Container(
                    padding: EdgeInsets.only(top: 10, bottom: 6, right: 10),
                    child: Text(model.title,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontFamily: "PingFang SC")));
  }
  Widget createCoupon(Product model) {
    return Container(
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 6, right: 6),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/color_dark@2x.png"))),
                  child: Text(model.couponAmount + "元券",
                      style: TextStyle(color: Colors.white, fontSize: 11)),
                );
  }
  Widget createPrice(Product model) {
    return Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "¥" +
                            (double.parse(model.price) -
                                    double.parse(model.couponAmount))
                                .toStringAsFixed(2) +
                            " ",
                        style: TextStyle(
                            color: ColorUtil.hexColor(0xFE3C40),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: model.price,
                        style: TextStyle(
                            color: ColorUtil.hexColor(0xc0c0c0),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough))
                  ]),
                );
  }
  Widget createTip(String title, String money, List<Color> colors) {
    return Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: colors,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(title + " ¥" + money,
                          style: TextStyle(color: Colors.white, fontSize: 11)));
  }

  Widget getItem() {
    var product = widget.product;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      child: Row(
        children: <Widget>[
          createAvatar(product),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                createTitle(product),
                createCoupon(product),
                createPrice(product),
                Row(children: <Widget>[
                  createTip("预估赚", product.money, [ColorUtil.hexColor(0xFE3C40),ColorUtil.hexColor(0xFCB853)]),
                  createTip("升级赚", product.upMoney, [ColorUtil.hexColor(0x7731E0),ColorUtil.hexColor(0xBE8AFE)]),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }



}