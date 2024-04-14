import 'package:cloud_firestore/cloud_firestore.dart';

class GoalsModel {
  final String name;
  final String price;
  final String category;
  final bool isAchieved;
  final String datetime;

  GoalsModel({
    required this.name,
    required this.price,
    required this.category,
    required this.isAchieved,
    required this.datetime,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'category': category,
      'isAchieved': isAchieved,
      'datetime': datetime,
    };
  }

  factory GoalsModel.fromJson(Map<String, dynamic> json) {
    return GoalsModel(
      name: json['name'],
      price: json['price'],
      category: json['category'],
      isAchieved: json['isAchieved'],
      datetime: json['datetime'],
    );
  }

  factory GoalsModel.fromSnapshot(DocumentSnapshot snapshot) {
    return GoalsModel(
      name: snapshot.get('name'),
      price: snapshot.get('price'),
      category: snapshot.get('category'),
      isAchieved: snapshot.get('isAchieved'),
      datetime: snapshot.get('datetime'),
    );
  }
}
