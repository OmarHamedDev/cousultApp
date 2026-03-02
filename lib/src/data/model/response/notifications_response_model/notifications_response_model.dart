import 'package:json_annotation/json_annotation.dart';

part 'notifications_response_model.g.dart';

@JsonSerializable()
class NotificationsResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<Data>? data;
  @JsonKey(name: "pagenation")
  final Pagenation? pagenation;
  @JsonKey(name: "unreadCount")
  final int? unreadCount;

  NotificationsResponseModel ({
    this.success,
    this.message,
    this.data,
    this.pagenation,
    this.unreadCount,
  });

  factory NotificationsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$NotificationsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NotificationsResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "userId")
  final String? userId;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "relatedId")
  final String? relatedId;
  @JsonKey(name: "relatedType")
  final String? relatedType;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "readAt")
  final dynamic? readAt;

  Data ({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.message,
    this.status,
    this.relatedId,
    this.relatedType,
    this.metadata,
    this.createdAt,
    this.readAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "amount")
  final String? amount;
  @JsonKey(name: "consultantName")
  final String? consultantName;

  Metadata ({
    this.amount,
    this.consultantName,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
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


