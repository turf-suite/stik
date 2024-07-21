
import 'package:uuid/uuid.dart';

class User {
  final Uuid id;
  String firstName;
  String? middleName;
  String lastName;
  String email;
  String? phone;
  String? avatarUrl;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.middleName,
    this.phone,
    this.avatarUrl
  });
}

class UserSignup {
  String firstName;
  String? middleName;
  String lastName;
  String email;
  String? phone;

  UserSignup({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.middleName,
    this.phone
  });
}