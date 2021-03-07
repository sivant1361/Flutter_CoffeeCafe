import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brew");

  Future updateUserData(String sugers, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({"sugers": sugers, "name": name, "strength": strength});
  }

  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
