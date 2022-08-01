class AppUser{
  final String username;
  final String id;
  final String password;
  final String email;
  final String phone;
  final bool activated;
  final bool documentsSubmitted;

  const AppUser({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.id,
    this.activated = false,
    this.documentsSubmitted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'activated' : activated,
      'id' : id,
      "documentsSubmitted": documentsSubmitted
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      activated: map['activated'] ?? false,
      id: map['id'],
      documentsSubmitted: map["documentsSubmitted"] ?? false
    );
  }
}
