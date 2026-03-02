import 'package:json_annotation/json_annotation.dart';

part 'user_booking_with_payment_response_model.g.dart';

@JsonSerializable()
class UserBookingWithPaymentResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  UserBookingWithPaymentResponseModel ({
    this.success,
    this.message,
    this.data,
  });

  factory UserBookingWithPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserBookingWithPaymentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserBookingWithPaymentResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "booking")
  final dynamic? booking;
  @JsonKey(name: "payment")
  final Payment? payment;

  Data ({
    this.booking,
    this.payment,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Payment {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "bookingId")
  final dynamic? bookingId;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "iframeUrl")
  final String? iframeUrl;

  Payment ({
    this.id,
    this.bookingId,
    this.amount,
    this.currency,
    this.status,
    this.iframeUrl,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaymentToJson(this);
  }
}


