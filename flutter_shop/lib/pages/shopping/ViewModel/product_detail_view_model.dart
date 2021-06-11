
import 'package:flutter_shop/pages/shopping/Model/platform_type.dart';
import 'package:flutter_shop/pages/shopping/Model/product_detail_model.dart';
import 'package:flutter_shop/service/service_method.dart';

class ProductDetailViewModel {

  ProductDetailModel product;

  Future getProductInfo(String id, Platform type) async {
    return requestProductInfo(id, type.toString());
  }
}