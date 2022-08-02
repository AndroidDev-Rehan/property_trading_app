import 'package:property_trading_app/models/app_user.dart';

class UserRequest{
  final String photoIdUrl;
  final String selfieUrl;
  final String photoIdBackUrl;
  final AppUser user;

  const UserRequest({
    required this.photoIdUrl,
    required this.selfieUrl,
    required this.user,
    required this.photoIdBackUrl
  });

  Map<String, dynamic> toMap() {
    return {
      'photoIdUrl': photoIdUrl,
      'photoIdBackUrl' : photoIdBackUrl,
      'selfieUrl': selfieUrl,
      'user': user.toMap(),
    };
  }

  factory UserRequest.fromMap(Map<String, dynamic> map) {
    return UserRequest(
      photoIdUrl: map['photoIdUrl'] as String,
      selfieUrl: map['selfieUrl'] as String,
      user: AppUser.fromMap(map['user']) ,
      photoIdBackUrl: map['photoIdBackUrl'],
    );
  }

}
