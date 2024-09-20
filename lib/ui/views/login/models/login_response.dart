import 'dart:convert';

class LoginResponse {
  String fullName;
  String email;
  int id;
  String token;
  bool isStaff;
  List<dynamic> roles;
  Organizations organizations;

  LoginResponse({
    required this.fullName,
    required this.email,
    required this.id,
    required this.token,
    required this.isStaff,
    required this.roles,
    required this.organizations,
  });

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        fullName: json["full_name"],
        email: json["email"],
        id: json["id"],
        token: json["token"],
        isStaff: json["is_staff"],
        roles: List<dynamic>.from(json["roles"].map((x) => x)),
        organizations: Organizations.fromJson(json["organizations"]),
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "id": id,
        "token": token,
        "is_staff": isStaff,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "organizations": organizations.toJson(),
      };
}

class Organizations {
  Organizations();

  factory Organizations.fromRawJson(String str) =>
      Organizations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Organizations.fromJson(Map<String, dynamic> json) => Organizations();

  Map<String, dynamic> toJson() => {};
}
