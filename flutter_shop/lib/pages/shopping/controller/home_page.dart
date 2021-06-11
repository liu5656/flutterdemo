import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/component/CategoryList.dart';
import 'package:flutter_shop/pages/shopping/Model/platform_type.dart';
import 'package:flutter_shop/pages/shopping/View/ProductCellView.dart';
import 'package:flutter_shop/pages/shopping/View/ProductListView.dart';
import 'package:flutter_shop/component/BannerWidget.dart';
import 'package:flutter_shop/component/refresh/Refresh.dart';
import 'package:flutter_shop/component/segment.dart';
import 'package:flutter_shop/model/CategoryModel.dart';
import 'package:flutter_shop/pages/shopping/Model/product.dart';
import 'package:flutter_shop/pages/shopping/controller/product_detail_page.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/pages/shopping/Model/Menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String contentText = "正在加载数据";
  List<Menu> menus = [];
  Menu firstMenu;
  Menu currentMenu;
  List<String> banners = [];
  List<CategoryModel> categorys = [];

  ScrollController _scrollController = ScrollController();
  double screenWidth = 375;

  @override
  void initState() {
    getHomePageContent("homeBanner")..then((res) {
      var result = res["result"] as List;
      var temp = result.map((value) {
        return value["img"].toString();
      }).toList();
      setState(() {
        banners = temp;
      });
    });

    getCategoryList().then((res) {
      var items = (res["result"] as List).map((json) {
        return CategoryModel.fromJson(json);
      }).toList();
      setState(() {
        categorys = items;
      });
    });

    getMenu().then((res) {
      var result;
      if (res is String) {
        result = (jsonDecode(res)["result"] as List).map((value) {
          return Menu.fromJson(value);
        }).toList();
      } else {
        result = (res["result"] as List).map((value) {
          return Menu.fromJson(value);
        }).toList();
      }
      setState(() {
        menus = result;
        firstMenu = menus.first;
        currentMenu = menus.first;
      });
      return getCommonProductList(currentMenu.name, currentMenu.pageNo,
          currentMenu.pageSize, currentMenu.id);
    }).then((value) {
      var result = (value["result"] as List).map((res) {
        return Product.fromJson(res);
      }).toList();
      setState(() {
        currentMenu.products = result;
      });
    });
    super.initState();
  }

  _requestCommonProduct(RefreshType type, Menu currentMenu) {
    if (type == RefreshType.refresh) {
      currentMenu.pageNo = 1;
    } else if (type == RefreshType.more) {
      currentMenu.pageNo += 1;
    }
    getCommonProductList(currentMenu.name, currentMenu.pageNo,
            currentMenu.pageSize, currentMenu.id)
        .then((value) {
      var result = (value["result"] as List).map((res) {
        return Product.fromJson(res);
      });

      setState(() {
        if (type == RefreshType.refresh || type == RefreshType.normal) {
          currentMenu.products = result.toList();
        } else if (type == RefreshType.more) {
          currentMenu.products.addAll(result.toList());
        }
      });
    });
  }

  _tapProduct(Product model) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailPage(
                goodsId: model.goodsId, platform: Platform.tb)));
  }

  _segmentCallback(Object obj, int index) {
    animateToOffset(_scrollController, index, animated: false);
  }

  _scrollTitleTo(int index) {}

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return _createSwiper();
  }

  _createSwiper() {
    return Scaffold(
        appBar: AppBar(title: Text("购物")), body: _horizontalListView());
  }

  Widget indexPageProduct(Menu menu) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: BannerWidget(imgUrls: banners),
              ),
              SizedBox(
                height: 195,
                child: CategoryList(items: categorys),
              )
            ],
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150,
          delegate: SliverChildBuilderDelegate((context, index) {
            if (index > 0 && index == menu.products.length - 1) {
              // 展示最后一条
              _requestCommonProduct(RefreshType.more, menu);
              return Container(
                padding: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            } else {
              var temp = menu.products[index];
              return ProductCellView(product: temp, tapCallback: _tapProduct);
            }
          }, childCount: menu.products.length),
        )
      ],
    );
  }

  _horizontalListView() {
    return Column(
      children: <Widget>[
        Segment(items: menus, indexCallback: _segmentCallback),
        Flexible(
            child: Listener(
          onPointerDown: getPointDownListenerInHorizontal(),
          onPointerUp: getPointUpListenerInHorizontal(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: menus.length,
            itemExtent: screenWidth,
            itemBuilder: (context, index) {
              var temp = menus[index];
              if (temp.products.length == 0 && index != 0) {
                _requestCommonProduct(RefreshType.normal, temp);
              }
              if (0 == index) {
                return indexPageProduct(menus[index]);
              } else {
                return ProductListView(
                    menu: menus[index],
                    callback: _requestCommonProduct,
                    tapCallback: _tapProduct);
              }
            },
          ),
        ))
      ],
    );
  }

//获取屏幕宽度

  Offset pointerStart;
  Offset pointerEnd;
  double touchRangeX = 0;
  double nextOffset = 0;
  int lastPage = 0;

  PointerDownEventListener getPointDownListenerInHorizontal() {
    return (event) {
      pointerStart = event.position;
    };
  }

  PointerUpEventListener getPointUpListenerInHorizontal() {
    return (event) {
      pointerEnd = event.position;
      touchRangeX = pointerStart.dx - pointerEnd.dx;

      if (touchRangeX.abs() < screenWidth / 4) {
        animateToOffset(_scrollController, lastPage);
        return;
      }
      if (touchRangeX < 0 && lastPage > 0) {
        lastPage--;
        _scrollTitleTo(lastPage);
        animateToOffset(_scrollController, lastPage);
      } else if (touchRangeX > 0 && lastPage < menus.length - 1) {
        lastPage++;
        _scrollTitleTo(lastPage);
        animateToOffset(_scrollController, lastPage);
      }
      print("$touchRangeX    $lastPage");
    };
  }

  void animateToOffset(ScrollController controller, int index,
      {bool animated = false, void Function() onScrollCompleted}) {
    if (animated == false) {
      controller.jumpTo(index * screenWidth);
    } else {
      controller
          .animateTo(index * screenWidth,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn)
          .then((value) {
        if (onScrollCompleted != null) {
          onScrollCompleted();
        }
      }).catchError((e) {
        print(e);
      });
    }
  }
}
