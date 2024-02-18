class UserModel {
  String? email;
  String? username;
  String? firstName;
  String? lastname;

  String? mobileNumber;
  bool? emailVerified;
  String? profilePicture;
  String? bearerToken;

  UserModel(
      {this.email,
      this.username,
      this.firstName,
      this.mobileNumber,
      this.emailVerified,
      this.profilePicture,
      this.bearerToken,
      this.lastname});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastname = json['last_name'];
    mobileNumber = json['mobile_number'];
    emailVerified = json['email_verified'];
    profilePicture = json['profile_picture'];
    bearerToken = json['bearer_token'];
  }
}
