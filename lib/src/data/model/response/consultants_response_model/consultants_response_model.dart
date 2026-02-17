import 'package:json_annotation/json_annotation.dart';

part 'consultants_response_model.g.dart';

@JsonSerializable()
class ConsultantsResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<Data>? data;
  @JsonKey(name: "pagenationData")
  final PagenationData? pagenationData;

  ConsultantsResponseModel ({
    this.success,
    this.message,
    this.data,
    this.pagenationData,
  });

  factory ConsultantsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ConsultantsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConsultantsResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "publicId")
  final String? publicId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "avatar")
  final String? avatar;
  @JsonKey(name: "rating")
  final int? rating;
  @JsonKey(name: "sessionDuration")
  final int? sessionDuration;
  @JsonKey(name: "_count")
  final Count? count;

  Data ({
    this.publicId,
    this.name,
    this.title,
    this.avatar,
    this.rating,
    this.sessionDuration,
    this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Count {
  @JsonKey(name: "reviews")
  final int? reviews;

  Count ({
    this.reviews,
  });

  factory Count.fromJson(Map<String, dynamic> json) {
    return _$CountFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CountToJson(this);
  }
}

@JsonSerializable()
class PagenationData {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalItems")
  final int? totalItems;
  @JsonKey(name: "totalPages")
  final int? totalPages;

  PagenationData ({
    this.page,
    this.limit,
    this.totalItems,
    this.totalPages,
  });

  factory PagenationData.fromJson(Map<String, dynamic> json) {
    return _$PagenationDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PagenationDataToJson(this);
  }
}


