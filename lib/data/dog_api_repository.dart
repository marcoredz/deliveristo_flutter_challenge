import 'package:deliveristo_flutter_challenge/core/http_client.dart';
import 'package:deliveristo_flutter_challenge/data/dog_api_response.dart';
import 'package:deliveristo_flutter_challenge/data/models/breeds.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dogApiRepositoryProvider = Provider<DogApiRepository>(
  (ref) => DogApiRepository(ref.watch(dioProvider)),
);

class DogApiRepository {
  final Dio _client;

  const DogApiRepository(this._client);

  Future<Breeds> getAllBreeds() async {
    final response = await _client.get('breeds/list/all');

    final dogApiResponse = DogApiResponse<Breeds>.fromJson(response.data);

    return dogApiResponse.message;
  }

  Future<String> getImageByBreed(String breed) async {
    final response = await _client.get('breed/$breed/images');

    final dogApiResponse = DogApiResponse<String>.fromJson(response.data);

    return dogApiResponse.message;
  }
}

final getAllBreedsProvider = FutureProvider.autoDispose<Breeds>((ref) {
  final repository = ref.watch(dogApiRepositoryProvider);
  return repository.getAllBreeds();
});

final getImageByBreedProvider = FutureProvider.autoDispose.family<String, String>((ref, breed) {
  final repository = ref.watch(dogApiRepositoryProvider);
  return repository.getImageByBreed(breed);
});
