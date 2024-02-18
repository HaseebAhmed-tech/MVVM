class UserModel {
  String? token;

  UserModel({String? tok}) {
    if (tok != null) {
      token = tok;
    }
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
