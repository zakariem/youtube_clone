// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String displayName;
  final String username;
  final String email;
  final String profilePic;
  final String subscribers;
  final String videos;
  final String uid;
  final String des;
  final String type;

  UserModel({
    required this.displayName,
    required this.username,
    required this.email,
    required this.profilePic,
    required this.subscribers,
    required this.videos,
    required this.uid,
    required this.des,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'username': username,
      'email': email,
      'profilePic': profilePic,
      'subscribers': subscribers,
      'videos': videos,
      'uid': uid,
      'des': des,
      'type': type,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      profilePic: map['profilePic'] as String,
      subscribers: map['subscribers'] as String,
      videos: map['videos'] as String,
      uid: map['uid'] as String,
      des: map['des'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
