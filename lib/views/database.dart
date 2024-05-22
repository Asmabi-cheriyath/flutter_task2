import 'package:cloud_firestore/cloud_firestore.dart';

class Databasedetails {
  Future adduser(Map<String, dynamic> detailsInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(detailsInfoMap);
  }

  Future<Stream<QuerySnapshot>> getuser() async {
    return await FirebaseFirestore.instance.collection("users").snapshots();
  }
  Future removeuser(String id)async{
    return await FirebaseFirestore.instance.collection("user").doc(id).delete();
  }
}
