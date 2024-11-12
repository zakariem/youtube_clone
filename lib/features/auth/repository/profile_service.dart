import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Updated provider name to be consistent
final usernameValidationProvider = StateProvider<bool>((ref) => true);

// The profile provider with consistent naming
final profileProvider = Provider<ProfileService>((ref) {
  return ProfileService(firestore: FirebaseFirestore.instance);
});

class ProfileService {
  final FirebaseFirestore _firestore;

  ProfileService({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<bool> validateUsername(String username) async {
    final user = await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    return user.docs.isEmpty; // If the list is empty, the username is available
  }
}
