class PoliceModel{
  String? uid; 
  String? name;
  String? email;
  String? password;
  

  PoliceModel({
    this.uid,
    this.name,
    this.email,
    this.password,
  });

  //Receiving data from server
  factory PoliceModel.fromMap(map){
    return PoliceModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  //send data to our server
  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
    };
  }
  
}