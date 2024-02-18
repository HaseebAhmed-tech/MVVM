import 'package:flutter/material.dart';
import 'package:mvvm_rest/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel userModel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', userModel.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    String? token = sp.getString('token');
    final userModel = UserModel(tok: token);
    return userModel;
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.remove('token');
  }
}
