import 'package:flutter/material.dart';
import 'package:mvvm_rest/model/user_model.dart';
import 'package:mvvm_rest/utils/routes/routes_name.dart';
import 'package:mvvm_rest/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (value.token == null || value.token == 'null') {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (route) => false);
      }
    }).onError((error, stackTrace) {
      debugPrint('Splash: Error: $error');
    });
  }
}
