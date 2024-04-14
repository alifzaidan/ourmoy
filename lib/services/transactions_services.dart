import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourmoy/models/transactions_model.dart';

CollectionReference transactions =
    FirebaseFirestore.instance.collection('transactions');

class DbTransactions {
  static Stream<QuerySnapshot> getData() {
    return transactions.orderBy('datetime', descending: true).snapshots();
  }

  static Stream<double> getTotalIncome() {
    return transactions.snapshots().map((snapshot) {
      double totalBalance = 0;
      List<QueryDocumentSnapshot> documents = snapshot.docs;
      for (var document in documents) {
        TransactionsModel transaction =
            TransactionsModel.fromJson(document.data() as Map<String, dynamic>);
        if (transaction.category == 'Income') {
          totalBalance += transaction.nominal;
        }
      }
      return totalBalance;
    });
  }

  static Stream<double> getTotalExpenses() {
    return transactions.snapshots().map((snapshot) {
      double totalBalance = 0;
      List<QueryDocumentSnapshot> documents = snapshot.docs;
      for (var document in documents) {
        TransactionsModel transaction =
            TransactionsModel.fromJson(document.data() as Map<String, dynamic>);
        if (transaction.category != 'Income') {
          totalBalance += transaction.nominal;
        }
      }
      return totalBalance;
    });
  }

  static Future<void> addData(
      {required TransactionsModel itemtransactions}) async {
    await transactions.add(itemtransactions.toJson());
  }

  static Future<void> addDataByDate(
      {required TransactionsModel itemtransactions}) async {
    DocumentReference docRef = transactions.doc(itemtransactions.datetime);
    await docRef.set(itemtransactions.toJson());
  }

  static Future<void> updateData(
      {required DocumentSnapshot snapshot,
      required TransactionsModel itemtransactions}) async {
    await transactions.doc(snapshot.id).update(itemtransactions.toJson());
  }

  static Future<void> deleteData(
      DocumentSnapshot<Object?> itemtransactions) async {
    await transactions.doc(itemtransactions.id).delete();
  }
}
