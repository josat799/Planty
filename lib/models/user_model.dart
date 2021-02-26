import 'package:flutter/material.dart';
import 'package:planty/models/plant_model.dart';

class User {
  String username;
  String name;
  String profilePicture;
  List<Plant> plants;
  List<User> followers;
  List<User> following;

  User({
    @required this.username,
    @required this.name,
    @required this.profilePicture,
  });
}
