class UserModel {
  String uId;
  String name;
  bool isAdmin;
  String email;

  UserModel({
    required this.uId,
    required this.name,
    required this.isAdmin,
    required this.email,
  });

  factory UserModel.fromJson(Map data, String uId) {
    return UserModel(
      uId: uId,
      name: data['name'],
      isAdmin: data['isAdmin'],
      email: data['email'],
    );
  }
}
