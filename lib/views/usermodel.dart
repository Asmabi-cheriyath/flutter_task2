class UserModel {
  String? email;
  String? password;
  String? username;
  String? dob;

  UserModel({required this.email,required this.password,required this.username,required this.dob});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    password = json['password'];
    username = json['Username'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['password'] = this.password;
    data['Username'] = this.username;
    data['dob'] = this.dob;
    return data;
  }
}