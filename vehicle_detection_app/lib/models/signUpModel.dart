class SignUpModel {
  String? uid;
  String? imageUrl;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? city;
  String? phoneNumber;
  String? description;

  SignUpModel({
    this.uid,
    this.imageUrl,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.city,
    this.phoneNumber,
    this.description,
  });

  // receiving data from server
  factory SignUpModel.fromMap(map) {
    return SignUpModel(
        uid: map['uid'],
        imageUrl: map['imageUrl'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        confirmPassword: map['confirmPassword'],
        city: map['city'],
        phoneNumber: map['phoneNumber'],
        description: map['description']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'city': city,
      'phoneNumber': phoneNumber,
      'description': description,
    };
  }
}
