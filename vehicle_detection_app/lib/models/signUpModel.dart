
class SignUpModel {
  String? uid;
  String? imageUrl;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  String? city;

  SignUpModel({this.uid, this.imageUrl, this.city, this.email, this.password, this.confirmPassword, this.phoneNumber});

  // receiving data from server
  factory SignUpModel.fromMap(map) {
    return SignUpModel(
      uid: map['uid'],
      imageUrl: map['imageUrl'],
      email: map['email'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
      phoneNumber: map['phoneNumber'],
      city: map['city'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'imageUrl': imageUrl,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phoneNumber': phoneNumber,
      'city': city,
    };
  }
}
