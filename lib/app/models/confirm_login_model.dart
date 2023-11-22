import 'dart:convert';


class ConfirLoginModel {
  final String accessToken;
  final String refreshToken;
  ConfirLoginModel({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  factory ConfirLoginModel.fromMap(Map<String, dynamic> map) {
    return ConfirLoginModel(
      accessToken: map['access_token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirLoginModel.fromJson(String source) => ConfirLoginModel.fromMap(json.decode(source));
}
