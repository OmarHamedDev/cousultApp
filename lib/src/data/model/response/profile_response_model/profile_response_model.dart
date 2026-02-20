import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  ProfileResponseModel ({
    this.success,
    this.message,
    this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "countryCode")
  final String? countryCode;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "provider")
  final String? provider;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "accountStatus")
  final String? accountStatus;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Data ({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.countryCode,
    this.phone,
    this.role,
    this.provider,
    this.isVerified,
    this.accountStatus,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}


