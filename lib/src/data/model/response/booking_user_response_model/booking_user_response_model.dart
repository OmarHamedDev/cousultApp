import 'package:json_annotation/json_annotation.dart';

part 'booking_user_response_model.g.dart';

@JsonSerializable()
class BookingUserResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<Data>? data;
  @JsonKey(name: "pagenation")
  final Pagenation? pagenation;

  BookingUserResponseModel ({
    this.success,
    this.message,
    this.data,
    this.pagenation,
  });

  factory BookingUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BookingUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BookingUserResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "userId")
  final String? userId;
  @JsonKey(name: "consultantId")
  final String? consultantId;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "startAt")
  final String? startAt;
  @JsonKey(name: "endAt")
  final String? endAt;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "consultant")
  final Consultant? consultant;
  @JsonKey(name: "payment")
  final Payment? payment;
  @JsonKey(name: "session")
  final dynamic? session;

  Data ({
    this.id,
    this.userId,
    this.consultantId,
    this.status,
    this.startAt,
    this.endAt,
    this.duration,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.consultant,
    this.payment,
    this.session,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "avatar")
  final dynamic? avatar;

  User ({
    this.id,
    this.name,
    this.email,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class Consultant {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "publicId")
  final String? publicId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "title")
  final String? title;

  Consultant ({
    this.id,
    this.publicId,
    this.name,
    this.avatar,
    this.title,
  });

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return _$ConsultantFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConsultantToJson(this);
  }
}

@JsonSerializable()
class Payment {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "status")
  final String? status;

  Payment ({
    this.id,
    this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaymentToJson(this);
  }
}

@JsonSerializable()
class Pagenation {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalItems")
  final int? totalItems;
  @JsonKey(name: "totalPages")
  final int? totalPages;

  Pagenation ({
    this.page,
    this.limit,
    this.totalItems,
    this.totalPages,
  });

  factory Pagenation.fromJson(Map<String, dynamic> json) {
    return _$PagenationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PagenationToJson(this);
  }
}


