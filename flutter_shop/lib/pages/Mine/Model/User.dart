class User {
  String userId;
  String rankTitle;
  String nickName;
  String avatar;
  String inviteCode;
  User({this.userId, this.nickName, this.avatar, this.inviteCode});
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json["userId"],
      nickName: json["nickName"],
      avatar: json["avatar"],
      inviteCode: json["inviteCode"]
    );
  }
}


class Account extends User {
  bool isLogin = false;
  String sessionId;
}

class statis {
  String title;
  double total;
  double withdrawal;
  String tip;
}