import 'package:cloud_firestore/cloud_firestore.dart';

class AccountsModel {
  final String name;
  final String shortName;
  final String email;
  final int balance;
  final String lastTransaction;
  final String color;

  AccountsModel({
    required this.name,
    required this.shortName,
    required this.email,
    required this.balance,
    required this.lastTransaction,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'shortName': shortName,
      'email': email,
      'balance': balance,
      'lastTransaction': lastTransaction,
      'color': color,
    };
  }

  factory AccountsModel.fromJson(Map<String, dynamic> json) {
    return AccountsModel(
      name: json['name'],
      shortName: json['shortName'],
      email: json['email'],
      balance: json['balance'],
      lastTransaction: json['lastTransaction'],
      color: json['color'],
    );
  }

  factory AccountsModel.fromSnapshot(DocumentSnapshot snapshot) {
    return AccountsModel(
      name: snapshot.get('name'),
      shortName: snapshot.get('shortName'),
      email: snapshot.get('email'),
      balance: snapshot.get('balance'),
      lastTransaction: snapshot.get('lastTransaction'),
      color: snapshot.get('color'),
    );
  }
}
