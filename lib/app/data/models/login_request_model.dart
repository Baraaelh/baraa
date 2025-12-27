// lib/app/data/models/login_request_model.dart

class LoginRequestModel {
  final String identifier; // email أو phone
  final String password;

  LoginRequestModel({
    required this.identifier,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "identifier": identifier,
      "password": password,
    };
  }
}
