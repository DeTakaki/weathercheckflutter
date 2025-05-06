class User {
  const User({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;

  User copyWith({
    String? userName,
    String? password,
  }) {
    return User(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}
