import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeecafebrew/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brew");

  Future updateUserData(String name, String sugers, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({"sugers": sugers, "name": name, "strength": strength});
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshots) {
    return snapshots.docs
        .map((doc) => Brew(
            name: doc.data()["name"] ?? "",
            sugers: doc.data()["sugers"] ?? "0",
            strength: doc.data()["strength"] ?? 0))
        .toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
