// lib/app/data/models/user_model.dart

class UserModel {
  final int id;
  final String username;
  final String email;
  final String? phone;
  final String role;
  final String? profileImage;
  final String? token;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.phone,
    required this.role,
    this.profileImage,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'],
      role: json['role'] ?? "user",
      profileImage: json['profile_image'],
      token: json['token'], // مهم جداً لتسجيل الدخول
    );
  }
}
