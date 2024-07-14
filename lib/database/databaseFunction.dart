import 'package:cloud_firestore/cloud_firestore.dart';

Create(String colName, docName, name, animal, int age) async {
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .set({'name': name, 'animal': animal, 'age': age});
  print('data added');
}

Update(String colName, docName, field, var newFieldValue) async {
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .update({field: newFieldValue});
  print("field updated");
}

Delete(String colName, docName) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).delete();
  print("field deleted");
}

Retrive(String colName)async{
  await  FirebaseFirestore.instance.collection(colName).get();
  print(FirebaseFirestore.instance.collection(colName).get());
}