import 'package:json_annotation/json_annotation.dart';

part 'reels_response_model.g.dart';

@JsonSerializable()
class ReelsResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<Data>? data;

  ReelsResponseModel ({
    this.success,
    this.message,
    this.data,
  });

  factory ReelsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ReelsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ReelsResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "videoUrl")
  final String? videoUrl;
  @JsonKey(name: "thumbnailUrl")
  final String? thumbnailUrl;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "order")
  final int? order;
  @JsonKey(name: "isFeatured")
  final bool? isFeatured;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "consultantId")
  final String? consultantId;
  @JsonKey(name: "consultantUpdateId")
  final dynamic? consultantUpdateId;
  @JsonKey(name: "consultant")
  final Consultant? consultant;

  Data ({
    this.id,
    this.videoUrl,
    this.thumbnailUrl,
    this.title,
    this.order,
    this.isFeatured,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.consultantId,
    this.consultantUpdateId,
    this.consultant,
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
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "publicId")
  final String? publicId;

  Consultant ({
    this.id,
    this.name,
    this.title,
    this.avatar,
    this.publicId,
  });

  factory Consultant.fromJson(Map<String, dynamic> json) {
    return _$ConsultantFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConsultantToJson(this);
  }
}


