class UserBookingWithPaymentRequestModel {
  UserBookingWithPaymentRequestModel({
      String? consultantId, 
      String? dayOfWeek, 
      num? startTime, 
      String? date,}){
    _consultantId = consultantId;
    _dayOfWeek = dayOfWeek;
    _startTime = startTime;
    _date = date;
}

  UserBookingWithPaymentRequestModel.fromJson(dynamic json) {
    _consultantId = json['consultantId'];
    _dayOfWeek = json['dayOfWeek'];
    _startTime = json['startTime'];
    _date = json['date'];
  }
  String? _consultantId;
  String? _dayOfWeek;
  num? _startTime;
  String? _date;

  String? get consultantId => _consultantId;
  String? get dayOfWeek => _dayOfWeek;
  num? get startTime => _startTime;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['consultantId'] = _consultantId;
    map['dayOfWeek'] = _dayOfWeek;
    map['startTime'] = _startTime;
    map['date'] = _date;
    return map;
  }

}