class AdminModel {
  String? uid;
  String? imageUrl;
  String? name;
  String? email;
  String? password;

  AdminModel({
    this.uid,
    this.imageUrl,
    this.name,
    this.email,
    this.password,
  });

  // receiving data from server
  factory AdminModel.fromMap(map) {
    return AdminModel(
        uid: map['uid'],
        imageUrl: map['imageUrl'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
