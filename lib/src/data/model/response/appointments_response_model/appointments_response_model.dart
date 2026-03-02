import 'package:json_annotation/json_annotation.dart';

part 'appointments_response_model.g.dart';

@JsonSerializable()
class AppointmentsResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<Data>? data;
  @JsonKey(name: "pagenation")
  final Pagenation? pagenation;

  AppointmentsResponseModel ({
    this.success,
    this.message,
    this.data,
    this.pagenation,
  });

  factory AppointmentsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AppointmentsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AppointmentsResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "dayOfWeek")
  final String? dayOfWeek;
  @JsonKey(name: "startTime")
  final int? startTime;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "consultantId")
  final String? consultantId;
  @JsonKey(name: "consultant")
  final Consultant? consultant;
  @JsonKey(name: "endTime")
  final int? endTime;
  @JsonKey(name: "isBooked")
  final bool? isBooked;

  Data ({
    this.id,
    this.dayOfWeek,
    this.startTime,
    this.createdAt,
    this.updatedAt,
    this.consultantId,
    this.consultant,
    this.endTime,
    this.isBooked,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
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
  @JsonKey(name: "sessionDuration")
  final int? sessionDuration;

  Consultant ({
    this.id,
    this.publicId,
    this.name,
    this.avatar,
    this.sessionDuration,
  });

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return _$ConsultantFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConsultantToJson(this);
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


