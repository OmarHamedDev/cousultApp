import 'package:json_annotation/json_annotation.dart';

part 'consultants_person_response_model.g.dart';

@JsonSerializable()
class ConsultantsPersonResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  ConsultantsPersonResponseModel ({
    this.success,
    this.message,
    this.data,
  });

  factory ConsultantsPersonResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ConsultantsPersonResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConsultantsPersonResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "publicId")
  final String? publicId;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "reason")
  final dynamic? reason;
  @JsonKey(name: "haveUpdate")
  final bool? haveUpdate;
  @JsonKey(name: "lastUpdateAt")
  final dynamic? lastUpdateAt;
  @JsonKey(name: "lastUpdateReason")
  final dynamic? lastUpdateReason;
  @JsonKey(name: "lastUpdateStatus")
  final dynamic? lastUpdateStatus;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "services")
  final List<String>? services;
  @JsonKey(name: "sessionDuration")
  final int? sessionDuration;
  @JsonKey(name: "sessionPrice")
  final int? sessionPrice;
  @JsonKey(name: "experienceYears")
  final int? experienceYears;
  @JsonKey(name: "proofPurpose")
  final String? proofPurpose;
  @JsonKey(name: "proofDocuments")
  final List<String>? proofDocuments;
  @JsonKey(name: "reelId")
  final dynamic? reelId;
  @JsonKey(name: "rating")
  final int? rating;
  @JsonKey(name: "totalBalance")
  final int? totalBalance;
  @JsonKey(name: "availableBalance")
  final int? availableBalance;
  @JsonKey(name: "reel")
  final dynamic? reel;

  Data ({
    this.id,
    this.publicId,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.reason,
    this.haveUpdate,
    this.lastUpdateAt,
    this.lastUpdateReason,
    this.lastUpdateStatus,
    this.avatar,
    this.name,
    this.title,
    this.description,
    this.services,
    this.sessionDuration,
    this.sessionPrice,
    this.experienceYears,
    this.proofPurpose,
    this.proofDocuments,
    this.reelId,
    this.rating,
    this.totalBalance,
    this.availableBalance,
    this.reel,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}


