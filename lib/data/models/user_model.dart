class Usermodel {
  String? id;
  final String username;
  final String useremail;
  final String password;

  Usermodel({
    this.id,
    required this.username,
    required this.useremail,
    required this.password,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      id: json['id'] ?? '',
      username: json['username'] as String,
      useremail: json['useremail'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'useremail': useremail,
      'password': password,
    };
  }
}