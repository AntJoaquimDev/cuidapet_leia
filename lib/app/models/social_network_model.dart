class SocialNetworkModel {
  String id;
  String nome;
  String email;
  String type;
  String accessToken;
  String? avatar;

  SocialNetworkModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.type,
    required this.accessToken,
    this.avatar,
  });
}
