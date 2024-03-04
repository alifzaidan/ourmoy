import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourmoy/models/accounts_model.dart';

CollectionReference accounts =
    FirebaseFirestore.instance.collection('accounts');

class DbAccounts {
  static Stream<QuerySnapshot> getData() {
    return accounts.snapshots();
  }

  static Stream<double> getTotalBalance() {
    return accounts.snapshots().map((snapshot) {
      double totalBalance = 0;
      List<QueryDocumentSnapshot> documents = snapshot.docs;
      for (var document in documents) {
        AccountsModel account =
            AccountsModel.fromJson(document.data() as Map<String, dynamic>);
        totalBalance += account.balance;
      }
      return totalBalance;
    });
  }

  static Future<void> addData({required AccountsModel itemaccounts}) async {
    await accounts.add(itemaccounts.toJson());
  }

  static Future<void> updateData(
      {required DocumentSnapshot snapshot,
      required AccountsModel itemaccounts}) async {
    await accounts.doc(snapshot.id).update(itemaccounts.toJson());
  }

  static Future<void> deleteData(DocumentSnapshot<Object?> itemaccounts) async {
    await accounts.doc(itemaccounts.id).delete();
  }
}
