class UserModel {
  String User_id;
  String User_name;
  bool isAdmin;
  String email;

  UserModel({
    required this.User_id,
    required this.User_name,
    required this.isAdmin,
    required this.email,
  });
  factory UserModel.fromJson(Map data, String User_id) {
    return UserModel(
      User_id: User_id,
      User_name: data['name'],
      isAdmin: data['isAdmin'],
      email: data['email'],
    );
  }

  void testfunction() {
    print("This is a Test Function");
  }
}
