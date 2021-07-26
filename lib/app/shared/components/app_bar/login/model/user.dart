import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String email;
  String createdAt;

  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> userJSON) {
    return User(
      id: userJSON['id'],
      name: userJSON['name'],
      email: userJSON['email'],
      createdAt: userJSON['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final userJSON = {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'created_at': this.createdAt,
    };
    return userJSON;
  }
}
