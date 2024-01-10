class PersonalData {
  String userId;
  String password;
  String email;


  PersonalData(this.userId, this.password, this.email);

  static PersonalData fromJson(Map<String, dynamic> json) {
    return PersonalData(json['userId'], json['password'], json['email']);
  }
}