// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogApiResponse<T> _$DogApiResponseFromJson<T>(Map<String, dynamic> json) =>
    DogApiResponse<T>(
      message: _messageFromJson(json['message']),
      status: json['status'] as String,
    );

Map<String, dynamic> _$DogApiResponseToJson<T>(DogApiResponse<T> instance) =>
    <String, dynamic>{
      'message': _messageToJson(instance.message),
      'status': instance.status,
    };
