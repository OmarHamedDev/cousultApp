// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultantsResponseModel _$ConsultantsResponseModelFromJson(
  Map<String, dynamic> json,
) => ConsultantsResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagenationData: json['pagenationData'] == null
      ? null
      : PagenationData.fromJson(json['pagenationData'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConsultantsResponseModelToJson(
  ConsultantsResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagenationData': instance.pagenationData,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  publicId: json['publicId'] as String?,
  name: json['name'] as String?,
  title: json['title'] as String?,
  avatar: json['avatar'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  sessionDuration: (json['sessionDuration'] as num?)?.toInt(),
  count: json['_count'] == null
      ? null
      : Count.fromJson(json['_count'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'publicId': instance.publicId,
  'name': instance.name,
  'title': instance.title,
  'avatar': instance.avatar,
  'rating': instance.rating,
  'sessionDuration': instance.sessionDuration,
  '_count': instance.count,
};

Count _$CountFromJson(Map<String, dynamic> json) =>
    Count(reviews: (json['reviews'] as num?)?.toInt());

Map<String, dynamic> _$CountToJson(Count instance) => <String, dynamic>{
  'reviews': instance.reviews,
};

PagenationData _$PagenationDataFromJson(Map<String, dynamic> json) =>
    PagenationData(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PagenationDataToJson(PagenationData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
    };
