class RegisterRequest {
  RegisterRequest({
      String? email, 
      String? password, 
      String? name, 
      String? phone, 
      String? countryCode,}){
    _email = email;
    _password = password;
    _name = name;
    _phone = phone;
    _countryCode = countryCode;
}

  RegisterRequest.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _name = json['name'];
    _phone = json['phone'];
    _countryCode = json['countryCode'];
  }
  String? _email;
  String? _password;
  String? _name;
  String? _phone;
  String? _countryCode;

  String? get email => _email;
  String? get password => _password;
  String? get name => _name;
  String? get phone => _phone;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['name'] = _name;
    map['phone'] = _phone;
    map['countryCode'] = _countryCode;
    return map;
  }

}