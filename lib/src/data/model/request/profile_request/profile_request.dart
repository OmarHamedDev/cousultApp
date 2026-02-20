class ProfileRequest {
  ProfileRequest({
      String? name, 
      String? avatar, 
      String? phone, 
      String? countryCode,}){
    _name = name;
    _avatar = avatar;
    _phone = phone;
    _countryCode = countryCode;
}

  ProfileRequest.fromJson(dynamic json) {
    _name = json['name'];
    _avatar = json['avatar'];
    _phone = json['phone'];
    _countryCode = json['countryCode'];
  }
  String? _name;
  String? _avatar;
  String? _phone;
  String? _countryCode;

  String? get name => _name;
  String? get avatar => _avatar;
  String? get phone => _phone;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['phone'] = _phone;
    map['countryCode'] = _countryCode;
    return map;
  }

}