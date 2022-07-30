class AppUser{
  final String username;
  final String password;
  final String email;
  final String phone;

  const AppUser({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }
}