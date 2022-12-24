import 'dart:convert';

class AppUser {
  String email;
  String? id;
  String? imageUrl;
  String userName;
  String phoneNumber;
  bool isAdmin;
  List? cartProducts;
  AppUser(
      {required this.email,
      required this.userName,
      required this.phoneNumber,
      this.id,
      this.imageUrl,
      this.cartProducts,
      this.isAdmin = false});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
        email: map['email'] ?? '',
        userName: map['userName'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        imageUrl: map['imageUrl'],
        cartProducts: map['cartProducts'],
        isAdmin: map['isAdmin'] ?? false);
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));
}
