import 'dart:convert';


class ConfirLoginModel {
  final String accessToken;
  final String refreshsToken;
  ConfirLoginModel({
    required this.accessToken,
    required this.refreshsToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_Token': accessToken,
      'refreshs_Token': refreshsToken,
    };
  }

  factory ConfirLoginModel.fromMap(Map<String, dynamic> map) {
    return ConfirLoginModel(
      accessToken: map['access_Token'] ?? '',
      refreshsToken: map['refreshs_Token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirLoginModel.fromJson(String source) => ConfirLoginModel.fromMap(json.decode(source));
}
