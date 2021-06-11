class ProductDetailModel {
  String platform;
  int goodsId;
  String title;
  String desc;
  String price;
  List<String> images;
  String saleNum;
  String money;
  String subsidy;
  String maxMoney;
  String couponStartFee;
  String couponId;
  String couponAmount;
  int couponStartTime;
  int couponEndTime;
  String couponSurplus;
  String couponAllplus;
  String couponUrl;
  String shopName;
  int shopId;
  String shopLogo;
  String tbGoodsPic;
  String isKeep;
  String shareQRCodeUrl;
  String goodsUrl;
  String tpwd;
  String tbType;

  String get shopLogoStr {
    return platform == 'tb' ? "details_taobao@2x.png" : (platform == 'pdd' ? 'details_pinduoduo@2x.png' : (platform == 'jd' ? "details_jingdong@2x.png" : "details_timg@2x.png"));
  }

  ProductDetailModel(
      {
        this.platform,
        this.goodsId,
        this.title,
        this.desc,
        this.price,
        this.images,
        this.saleNum,
        this.money,
        this.subsidy,
        this.maxMoney,
        this.couponStartFee,
        this.couponId,
        this.couponAmount,
        this.couponStartTime,
        this.couponEndTime,
        this.couponSurplus,
        this.couponAllplus,
        this.couponUrl,
        this.shopName,
        this.shopId,
        this.shopLogo,
        this.tbGoodsPic,
        this.isKeep,
        this.shareQRCodeUrl,
        this.goodsUrl,
        this.tpwd,
        this.tbType});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    platform = json['platform'];
    goodsId = json['goodsId'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    images = json['images'].cast<String>();
    saleNum = json['saleNum'];
    money = json['money'];
    subsidy = json['subsidy'];
    maxMoney = json['maxMoney'];
    couponStartFee = json['couponStartFee'];
    couponId = json['couponId'];
    couponAmount = json['couponAmount'];
    couponStartTime = json['couponStartTime'];
    couponEndTime = json['couponEndTime'];
    couponSurplus = json['couponSurplus'];
    couponAllplus = json['couponAllplus'];
    couponUrl = json['couponUrl'];
    shopName = json['shopName'];
    shopId = json['shopId'];
    shopLogo = json['shopLogo'];
    tbGoodsPic = json['tbGoodsPic'];
    isKeep = json['isKeep'];
    shareQRCodeUrl = json['shareQRCodeUrl'];
    goodsUrl = json['goodsUrl'];
    tpwd = json['tpwd'];
    tbType = json['tbType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform;
    data['goodsId'] = this.goodsId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['images'] = this.images;
    data['saleNum'] = this.saleNum;
    data['money'] = this.money;
    data['subsidy'] = this.subsidy;
    data['maxMoney'] = this.maxMoney;
    data['couponStartFee'] = this.couponStartFee;
    data['couponId'] = this.couponId;
    data['couponAmount'] = this.couponAmount;
    data['couponStartTime'] = this.couponStartTime;
    data['couponEndTime'] = this.couponEndTime;
    data['couponSurplus'] = this.couponSurplus;
    data['couponAllplus'] = this.couponAllplus;
    data['couponUrl'] = this.couponUrl;
    data['shopName'] = this.shopName;
    data['shopId'] = this.shopId;
    data['shopLogo'] = this.shopLogo;
    data['tbGoodsPic'] = this.tbGoodsPic;
    data['isKeep'] = this.isKeep;
    data['shareQRCodeUrl'] = this.shareQRCodeUrl;
    data['goodsUrl'] = this.goodsUrl;
    data['tpwd'] = this.tpwd;
    data['tbType'] = this.tbType;
    return data;
  }
}

