import 'package:deliveristo_flutter_challenge/src/shared/domain/models/dog_api_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DogApiResponse _messageFromJson', () {
    test('should return a String when JSON is a String', () {
      const jsonString = 'https://images.dog.ceo/breeds/setter-irish/n02100877_2793.jpg';

      final result = messageFromJson(jsonString);

      expect(result, jsonString);
    });

    test('should return a List<String> when JSON is a List', () {
      final jsonList = ['item1', 'item2'];

      final result = messageFromJson(jsonList);

      expect(result, jsonList);
    });

    test('should return a Map<String, List<String>> when JSON is a Map', () {
      final jsonMap = {
        'appenzeller': [],
        'australian': ['shepherd'],
      };

      final result = messageFromJson(jsonMap);

      expect(result, jsonMap);
    });

    test('should throw ArgumentError for invalid JSON type', () {
      const invalidJson = 42; // Current invalid JSON type

      expect(() => messageFromJson(invalidJson), throwsArgumentError);
    });
  });
}
