class UserModel {
  String uid;
  String email;
  String password;
  String name;
  // AddressModel addressModel;

  UserModel(
      {
      // required this.addressModel,
      required this.email,
      required this.name,
      required this.password,
      required this.uid});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "password": password,
        // "addressModel": addressModel
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        // addressModel: json["addressModel"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        uid: json["uid"]);
  }
}

class AddressModel {}
