import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> addDeal(String medName, String expDate, String quantity,
    String price, String description, String photo) async {
  try {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc('Data')
        .collection('Deals')
        .doc(medName);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({
          'Date': expDate,
          'Quantity': quantity,
          'Price': price,
          'Description': description,
          'Photo': photo,
        });
        return true;
      }

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      transaction.update(documentReference, {
        'Date': expDate,
        'Quantity': quantity,
        'Price': price,
        'Description': description,
        'Photo': photo,
      });
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> deleteDeal(String medName) async {
  try {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc('Data')
        .collection('Deals')
        .doc(medName);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (snapshot.exists) {
        documentReference.delete();
        return true;
      }
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}
