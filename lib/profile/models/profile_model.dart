import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

class Profile {
  ProfileData data;

  Profile({
    required this.data,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        data: ProfileData.fromJson(json["data"]),
      );
}

class ProfileData {
  String name;
  String email;
  String? phone;
  String? referralCode;
  DateTime registeredAt;
  Broker? broker;
  Subscription? subscription;

  ProfileData({
    required this.name,
    required this.email,
    required this.phone,
    required this.referralCode,
    required this.registeredAt,
    required this.broker,
    required this.subscription,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        referralCode: json["referral_code"],
        registeredAt: DateTime.parse(json["registered_at"]),
        broker: json["broker"] == null ? null : Broker.fromJson(json["broker"]),
        subscription: json["subscription"] == null
            ? null
            : Subscription.fromJson(json["subscription"]),
      );
}

class Broker {
  String name;
  String url;
  String referralCode;

  Broker({
    required this.name,
    required this.url,
    required this.referralCode,
  });

  factory Broker.fromJson(Map<String, dynamic> json) => Broker(
        name: json["name"],
        url: json["url"],
        referralCode: json["referral_code"],
      );
}

class Subscription {
  Plan plan;
  int period;
  DateTime expiresAt;
  DateTime subscribedAt;

  Subscription({
    required this.plan,
    required this.period,
    required this.expiresAt,
    required this.subscribedAt,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        plan: Plan.fromJson(json["plan"]),
        period: json["period"],
        expiresAt: DateTime.parse(json["expires_at"]),
        subscribedAt: DateTime.parse(json["subscribed_at"]),
      );
}

class Plan {
  String title;
  String name;
  String descriptions;

  Plan({
    required this.title,
    required this.name,
    required this.descriptions,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        title: json["title"],
        name: json["name"],
        descriptions: json["descriptions"],
      );
}
