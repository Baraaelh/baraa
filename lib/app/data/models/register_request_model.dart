// lib/app/data/models/register_request_model.dart

class RegisterRequestModel {
  final String username;
  final String emailOrPhone;
  final String password;
  final String confirmPassword;

  RegisterRequestModel({
    required this.username,
    required this.emailOrPhone,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email_or_phone": emailOrPhone,
      "password": password,
      "password_confirmation": confirmPassword,
    };
  }
}
