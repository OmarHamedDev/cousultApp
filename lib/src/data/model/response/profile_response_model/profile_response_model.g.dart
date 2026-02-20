// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => ProfileResponseModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProfileResponseModelToJson(
  ProfileResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  id: json['id'] as String?,
  email: json['email'] as String?,
  name: json['name'] as String?,
  avatar: json['avatar'] as String?,
  countryCode: json['countryCode'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  provider: json['provider'] as String?,
  isVerified: json['isVerified'] as bool?,
  accountStatus: json['accountStatus'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'avatar': instance.avatar,
  'countryCode': instance.countryCode,
  'phone': instance.phone,
  'role': instance.role,
  'provider': instance.provider,
  'isVerified': instance.isVerified,
  'accountStatus': instance.accountStatus,
  'createdAt': instance.createdAt,
};
