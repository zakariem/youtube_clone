import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final editSitingsProvider = Provider((ref) => EditField(auth: FirebaseAuth.instance, fireStore: FirebaseFirestore.instance,),);

class EditField {
  final FirebaseAuth _auth;
  final FirebaseFirestore _fireStore;

  EditField({required FirebaseAuth auth, required FirebaseFirestore fireStore,}) : _auth = auth, _fireStore = fireStore;

  editDisplayName(String displayName){
    _fireStore.collection('users').doc(_auth.currentUser!.uid).update({
      "displayName": displayName,
    });
  }

  editDisplayUserName(String username){
    _fireStore.collection('users').doc(_auth.currentUser!.uid).update({
      "username": username,
    });
  }

  editDisplayDes(String des){
    _fireStore.collection('users').doc(_auth.currentUser!.uid).update({
      "des": des,
    });
  }

}