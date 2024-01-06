import 'package:json_annotation/json_annotation.dart';

part 'dog_api_response.g.dart';

@JsonSerializable()
class DogApiResponse<T> {
  @JsonKey(fromJson: _messageFromJson, toJson: _messageToJson)
  final T message;
  final String status;

  const DogApiResponse({
    required this.message,
    required this.status,
  });

  factory DogApiResponse.fromJson(Map<String, dynamic> json) => _$DogApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DogApiResponseToJson(this);
}

dynamic _messageToJson(dynamic message) {
  return message;
}

dynamic _messageFromJson(dynamic json) {
  if (json is String) {
    return json;
  } else if (json is Map<String, dynamic>) {
    return json.map(
      (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    );
  }

  throw ArgumentError.value(json, 'json', 'Invalid message type');
}
