import 'dart:convert';

Signup signupFromJson(String str) => Signup.fromJson(json.decode(str));

class Signup {
  Data data;
  String message;

  Signup({
    required this.data,
    required this.message,
  });

  factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );
}

class Data {
  String name;
  String email;
  String phone;
  String referralCode;

  Data({
    required this.name,
    required this.email,
    required this.phone,
    required this.referralCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        referralCode: json["referral_code"],
      );
}
