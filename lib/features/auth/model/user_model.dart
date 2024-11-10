// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String displayName;
  final String username;
  final String email;
  final String profilePic;
  final List<String> subscribers;
  final int videos;
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
      subscribers: List<String>.from(map['subscribers'] ?? []),
      videos: map['videos'] as int,
      uid: map['uid'] as String,
      des: map['des'] as String,
      type: map['type'] as String,
    );
  }
}
