class UserModel {
  String? uid;
  String? age;
  String? email;
  String? imageurl;

  UserModel({this.uid, this.email, this.imageurl, this.age});

  //data receaving form server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        imageurl: map['imageurl'],
        age: map['age']);
  }
  //data sending to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'imageurl': imageurl,
      'age': age,
    };
  }
}
