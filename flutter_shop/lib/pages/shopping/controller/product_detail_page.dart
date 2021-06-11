import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/component/BannerWidget.dart';
import 'package:flutter_shop/pages/shopping/Model/platform_type.dart';
import 'package:flutter_shop/pages/shopping/Model/product_detail_model.dart';
import 'package:flutter_shop/pages/shopping/ViewModel/product_detail_view_model.dart';
import 'package:flutter_shop/utils/ColorEx.dart';

import 'package:flutter_shop/utils/app_utils.dart';

class ProductDetailPage extends StatefulWidget {
  final String goodsId;
  final Platform platform;

  ProductDetailPage({this.goodsId, this.platform});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();

}

class _ProductDetailPageState extends State<ProductDetailPage> {

  double screenWidth = 375;
  bool detailsFold = true;

  ProductDetailViewModel viewModel = ProductDetailViewModel();

  Widget banner() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width,
      child: Stack(
        children: <Widget>[
          BannerWidget(imgUrls: [viewModel.product.tbGoodsPic]),
          Positioned(
            left: 0,
            top: 16,
            width: 60,
            height: 60,
            child: FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  },
                child: Image.asset("images/details_return.png")),
          )
        ],
      )
    );
  }

  Widget price() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
//      decoration: BoxDecoration(color: Colors.blue),
      width: screenWidth,
      height: 52,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "¥",
                  style: TextStyle(color:  ColorUtil.hexColor(0xFE3C40), fontSize: 11, fontWeight: FontWeight.w400)
              ),
              TextSpan(
                  text: (double.parse(viewModel.product.price) - double.parse(viewModel.product.couponAmount)).toStringAsFixed(2),
                  style: TextStyle(color: ColorUtil.hexColor(0xFE3C40), fontSize: 22, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "券后 ",
                  style: TextStyle(color:  ColorUtil.hexColor(0xFE3C40), fontSize: 11, fontWeight: FontWeight.w400)
              ),
              TextSpan(
                  text: "原价" + viewModel.product.price,
                  style: TextStyle(color: ColorUtil.hexColor(0xc0c0c0), fontSize: 11, fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough))
            ]),
          ),
          Text("销量 " + viewModel.product.saleNum, style: TextStyle(color: ColorUtil.hexColor(0xC0C0C0)))
        ],
      ),
    );
  }

  Widget subsidy() {
    double width = (screenWidth - 20) / 3;
    return Row(
      children: <Widget>[
        Container(
          width: width,
          height: 40,
          margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
          decoration: BoxDecoration(
            color: ColorUtil.hexColor(0xFE3C40),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
          ),
          child: Center(
            child: Text("下单返" + viewModel.product.money),
          ),
        ),
        Container(
          width: width,
          height: 40,
          margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
          decoration: BoxDecoration(
              color: ColorUtil.hexColor(0xFFF1D7),
          ),
          child: Center(
            child: Text("最高返" + viewModel.product.maxMoney),
          ),
        ),
        Container(
          width: width,
          height: 40,
          margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
          decoration: BoxDecoration(
              color: ColorUtil.hexColor(0xFFF1D7),
              borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5))
          ),
          child: Center(
            child: Text("升级VIP"),
          ),
        )
      ],
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 10, right: 10),
      child: Text(viewModel.product.title),
    );
  }

  Widget coupon() {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 14),
      width: screenWidth,
      height: 78,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/details_coupons_bj.png")
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                              text: viewModel.product.couponAmount,
                              style: TextStyle(color:  Colors.white, fontSize: 22, fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: "元优惠券",
                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w400))
                        ]
                    )
                ),
                Text("使用时间：2019.06.19-2019.10.09", style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 14),
            height: 30,
            width: 88,
            child: FlatButton(
              color: ColorUtil.hexColor(0xFFA724),
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text("领券购买", style: TextStyle(color: Colors.white)),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }

  Widget shopInfo() {
    return Container(
      height: 84,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            viewModel.product.shopLogo == null ? Image.asset('images/' + viewModel.product.shopLogoStr, width: 44, height: 44) : Image.network(viewModel.product.shopLogo, width: 44, height: 44),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(viewModel.product.shopName, maxLines: 1, overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      )
    );
  }

  Widget detail() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(color: Colors.red, width: 30, height: 1),
              Text("宝贝详情", style: TextStyle(color: ColorUtil.hexColor(0x333333), fontWeight: FontWeight.bold, fontSize: 16)),
              Container(color: Colors.red, width: 30, height: 1)
            ],
          ),
          imgIntroduce(),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(detailsFold ? "点击展开 " : "点击收起 ", style: TextStyle(color: ColorUtil.hexColor(0xFE3C40), fontSize: 13)),
                  Image.asset(detailsFold ? "images/details_down@2x.png" : "images/details_top@2x.png", width: 16, height: 16)
                ],
              ),
            ),
            onTap: (){
              setState(() {
                detailsFold = !detailsFold;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget imgIntroduce() {
    List<Widget> imgs = [];
    viewModel.product.images.forEach((url){
      imgs.add(Image.network(url, fit: BoxFit.fitWidth));
    });
    Widget intro = Column(
      children: imgs,
    );
    return detailsFold ? Container() : intro;
  }

  Widget _bottomPanel() {
    return Container(
      width: screenWidth,
      height: 64,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('images/details_home@2x.png', width: 22, height: 22),
                      Text("首页", style: TextStyle(color: ColorUtil.hexColor(0x333333), fontSize: 11))
                    ],
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(viewModel.product?.isKeep == "1" ? 'images/details_collection_selected@2x.png' : 'images/details_collection_normal@2x.png', width: 22, height: 22),
                    Text("收藏", style: TextStyle(color: ColorUtil.hexColor(0x333333), fontSize: 11))
                  ],
                ),

              ],
            ),
          ),          

          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: Row(
              children: <Widget>[
                FlatButton(
                  color: ColorUtil.hexColor(0xFFA724),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(22), bottomLeft: Radius.circular(22))
                  ),
                  child: Text("分享赚\n省¥2.11", style: TextStyle(color: Colors.white, fontSize: 13)),
                  onPressed: (){
                    if (viewModel.product.couponUrl != null) {
                      AppUtils.SSSlaunch(viewModel.product.couponUrl.replaceFirst('https://', 'taobao://'));
                    }
                  },
                ),
                FlatButton(
                  color: ColorUtil.hexColor(0xFE3C40),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(22), bottomRight: Radius.circular(22))
                  ),
                  child: Text("购买\n省¥2.11", style: TextStyle(color: Colors.white, fontSize: 13), textAlign: TextAlign.center,),
                  onPressed: (){
                    AppUtils.SSSlaunch("openApp.jdMobile://u.jd.com/3RfzMt");
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }



  Widget _initializeView() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: viewModel.product == null ? Container() : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  banner(),
                  price(),
                  subsidy(),
                  title(),
                  coupon(),
                  shopInfo(),
                  detail()
                ],
              ),
            ),
          ),
          _bottomPanel(),
        ],
      ),
    );
  }

  _initializeDatasource() async {
    await viewModel.getProductInfo(widget.goodsId, widget.platform).then((result){
      var temp = ProductDetailModel.fromJson(result["result"] as Map<String, dynamic>);
      setState(() {
          viewModel.product = temp;
      });
    });
  }

  @override
  void initState() {
    _initializeDatasource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorUtil.hexColor(0xF8F8F8),
      body: _initializeView(),
    );
  }
}
