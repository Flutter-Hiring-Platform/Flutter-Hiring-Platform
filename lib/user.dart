class User {
  final String username;
  final String email;
  final String password;

  const User({ required this.username, required this.password, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'username': String username,
        'email': String email,
        'password': String password,
      } =>
        User(
          username: username,
          email: email,
          password: password,
        ),
      _ => throw const FormatException('Failed to load User.'),
    };
  }
}