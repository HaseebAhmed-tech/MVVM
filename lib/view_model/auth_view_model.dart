import 'package:flutter/material.dart';
import 'package:mvvm_rest/model/user_model.dart';

import '../repository/auth_repository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import 'user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository _myRepo = AuthRepository();
  final userViewModel = UserViewModel();
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _suLoading = false;
  bool get suLoading => _suLoading;
  void setSuLoading(bool value) {
    _suLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      final userModel = UserModel.fromJson(value);
      setLoading(false);
      userViewModel.saveUser(userModel);
      Utils.toastMessage('Login Successful');
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (route) => false);
      debugPrint('loginApi: ${value.toString()}');
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(context, error.toString());
      debugPrint('loginApi error: $error');
    });
  }

  Future<void> registerApi(dynamic data, BuildContext context) async {
    setSuLoading(true);
    _myRepo.registerApi(data).then((value) {
      setSuLoading(false);
      Utils.toastMessage('Signup Successful');
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (route) => false);
      debugPrint('signupApi: ${value.toString()}');
    }).onError((error, stackTrace) {
      setSuLoading(false);
      Utils.flushBarErrorMessage(context, error.toString());
      debugPrint('signupApi error: $error');
    });
  }
}
