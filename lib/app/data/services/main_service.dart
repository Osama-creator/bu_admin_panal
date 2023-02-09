import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('categories');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }
  // print(collectio);
  // 3
  // Future<DocumentReference> addPet(Category pet) {
  //   return collection.add(pet.toJson());
  // }
  // 4
  // void updatePet(Pet pet) async {
  //   await collection.doc(pet.referenceId).update(pet.toJson());
  // }
  // 5
  // void deletePet(Category category) async {
  //   await collection.doc(category.id).delete();
  // }
}
