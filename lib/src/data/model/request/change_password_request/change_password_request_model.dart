class ChangePasswordRequestModel {
  ChangePasswordRequestModel({
      String? currentPassword, 
      String? newPassword,}){
    _currentPassword = currentPassword;
    _newPassword = newPassword;
}

  ChangePasswordRequestModel.fromJson(dynamic json) {
    _currentPassword = json['currentPassword'];
    _newPassword = json['newPassword'];
  }
  String? _currentPassword;
  String? _newPassword;

  String? get currentPassword => _currentPassword;
  String? get newPassword => _newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPassword'] = _currentPassword;
    map['newPassword'] = _newPassword;
    return map;
  }

}