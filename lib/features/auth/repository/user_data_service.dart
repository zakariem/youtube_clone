import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/features/auth/model/user_model.dart';

final userDataServiceProvider = Provider<UserDataService>(
  (ref) => UserDataService(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class UserDataService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  UserDataService({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  addUserDataToFirestore({
    required String displayName,
    required String username,
    required String email,
    required String profilePic,
    required String des,
  }) async {
    final user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePic: profilePic,
      subscribers: [],
      videos: 0,
      uid: _auth.currentUser!.uid,
      des: des,
      type: "user",
    );

    await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .set(user.toMap());
  }
}
