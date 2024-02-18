import 'package:mvvm_rest/res/app_url.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppURL.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppURL.registerEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
