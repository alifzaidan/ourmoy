import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionsModel {
  final int nominal;
  final String description;
  final String category;
  final String account;
  final String datetime;

  TransactionsModel({
    required this.nominal,
    required this.description,
    required this.category,
    required this.account,
    required this.datetime,
  });

  Map<String, dynamic> toJson() {
    return {
      'nominal': nominal,
      'description': description,
      'category': category,
      'account': account,
      'datetime': datetime,
    };
  }

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      nominal: json['nominal'],
      description: json['description'],
      category: json['category'],
      account: json['account'],
      datetime: json['datetime'],
    );
  }

  factory TransactionsModel.fromSnapshot(DocumentSnapshot snapshot) {
    return TransactionsModel(
      nominal: snapshot.get('nominal'),
      description: snapshot.get('description'),
      category: snapshot.get('category'),
      account: snapshot.get('account'),
      datetime: snapshot.get('datetime'),
    );
  }
}
