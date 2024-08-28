import 'package:assignment_manager/data/services/api_service.dart';
import 'package:get/get.dart';

import '../data/models/response_model.dart';
import '../data/network_const.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage ?? "SignUp failed! Try again";

  Future<bool> signUp(String name, String email, String password) async {
    _inProgress = true;
    update();
    Map<String, dynamic> inputParams = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password,
    };
    ResponseModel response = await ApiService.postRequest(
      NetworkConst.registration,
      inputParams,
    );
    _inProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
