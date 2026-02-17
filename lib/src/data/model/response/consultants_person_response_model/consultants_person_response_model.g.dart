// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultants_person_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultantsPersonResponseModel _$ConsultantsPersonResponseModelFromJson(
  Map<String, dynamic> json,
) => ConsultantsPersonResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConsultantsPersonResponseModelToJson(
  ConsultantsPersonResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  publicId: json['publicId'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  status: json['status'] as String?,
  reason: json['reason'],
  haveUpdate: json['haveUpdate'] as bool?,
  lastUpdateAt: json['lastUpdateAt'],
  lastUpdateReason: json['lastUpdateReason'],
  lastUpdateStatus: json['lastUpdateStatus'],
  avatar: json['avatar'] as String?,
  name: json['name'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  services: (json['services'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  sessionDuration: (json['sessionDuration'] as num?)?.toInt(),
  sessionPrice: (json['sessionPrice'] as num?)?.toInt(),
  experienceYears: (json['experienceYears'] as num?)?.toInt(),
  proofPurpose: json['proofPurpose'] as String?,
  proofDocuments: (json['proofDocuments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  reelId: json['reelId'],
  rating: (json['rating'] as num?)?.toInt(),
  totalBalance: (json['totalBalance'] as num?)?.toInt(),
  availableBalance: (json['availableBalance'] as num?)?.toInt(),
  reel: json['reel'],
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'publicId': instance.publicId,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'status': instance.status,
  'reason': instance.reason,
  'haveUpdate': instance.haveUpdate,
  'lastUpdateAt': instance.lastUpdateAt,
  'lastUpdateReason': instance.lastUpdateReason,
  'lastUpdateStatus': instance.lastUpdateStatus,
  'avatar': instance.avatar,
  'name': instance.name,
  'title': instance.title,
  'description': instance.description,
  'services': instance.services,
  'sessionDuration': instance.sessionDuration,
  'sessionPrice': instance.sessionPrice,
  'experienceYears': instance.experienceYears,
  'proofPurpose': instance.proofPurpose,
  'proofDocuments': instance.proofDocuments,
  'reelId': instance.reelId,
  'rating': instance.rating,
  'totalBalance': instance.totalBalance,
  'availableBalance': instance.availableBalance,
  'reel': instance.reel,
};
