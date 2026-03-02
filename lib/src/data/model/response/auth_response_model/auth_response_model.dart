import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final Data? data;

  AuthResponseModel ({
    this.success,
    this.message,
    this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponseModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "tokens")
  final Tokens? tokens;

  Data ({
    this.tokens,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Tokens {
  @JsonKey(name: "accessToken")
  final String? accessToken;
  @JsonKey(name: "refreshToken")
  final String? refreshToken;

  Tokens ({
    this.accessToken,
    this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return _$TokensFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TokensToJson(this);
  }
}


