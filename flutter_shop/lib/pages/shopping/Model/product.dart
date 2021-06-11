class Product {
  String goodsId;
  String title;
  String shopName;
  String saleNum;
  String platform;
  String couponAmount;
  String money;
  String price;
  String imageUrl;
  String tbType;
  String upMoney;
  
  Product({this.goodsId, this.title, this.shopName, this.saleNum, this.platform, this.couponAmount, this.money, this.price, this.imageUrl, this.tbType, this.upMoney});

  factory Product.fromJson(Map<String, dynamic> json) {
    Product p = Product(
      goodsId: json["goodsId"], 
      title: json["title"], 
      saleNum: json["saleNum"], 
      platform: json["platform"], 
      couponAmount: json["couponAmount"], 
      money: json["money"], 
      price: json["price"], 
      imageUrl: json["imageUrl"], 
      tbType: json["tbType"],
      upMoney: json["upMoney"],
      );
    return p;
  }
}
