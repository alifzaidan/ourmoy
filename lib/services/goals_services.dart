import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourmoy/models/goals_model.dart';

CollectionReference goals = FirebaseFirestore.instance.collection('goals');

class DbGoals {
  static Stream<QuerySnapshot> getData() {
    return goals.snapshots();
  }

  static Future<void> addData({required GoalsModel itemgoals}) async {
    await goals.add(itemgoals.toJson());
  }

  static Future<void> updateData(
      {required DocumentSnapshot snapshot,
      required GoalsModel itemgoals}) async {
    await goals.doc(snapshot.id).update(itemgoals.toJson());
  }

  static Future<void> deleteData(DocumentSnapshot<Object?> itemgoals) async {
    await goals.doc(itemgoals.id).delete();
  }
}
