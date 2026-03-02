class LoginRequest {
  LoginRequest({String? email, String? password, List<String>? role}) {
    _email = email;
    _password = password;
    _role = ["USER"];
  }

  LoginRequest.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _role = json['role'] != null ? json['role'].cast<String>() : [];
  }
  String? _email;
  String? _password;
  List<String>? _role;

  String? get email => _email;
  String? get password => _password;
  List<String>? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['role'] = _role;
    return map;
  }
}
