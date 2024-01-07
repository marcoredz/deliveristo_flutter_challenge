import 'package:deliveristo_flutter_challenge/src/core/http_client.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'models/breeds.dart';
import 'models/dog_api_response.dart';

part 'dog_api_repository.g.dart';

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

  // Random section

  Future<String> getRandomImageByBreed(String breed) async {
    final response = await _client.get('breed/$breed/images/random');

    final dogApiResponse = DogApiResponse<String>.fromJson(response.data);

    return dogApiResponse.message;
  }

  Future<String> getRandomImageBySubBreed(String breed, String subBreed) async {
    final response = await _client.get('breed/$breed/$subBreed/images/random');

    final dogApiResponse = DogApiResponse<String>.fromJson(response.data);

    return dogApiResponse.message;
  }

  // List section

  Future<List<String>> getImagesListByBreed(String breed) async {
    final response = await _client.get('breed/$breed/images');

    final dogApiResponse = DogApiResponse<List<String>>.fromJson(response.data);

    return dogApiResponse.message;
  }

  Future<List<String>> getImagesListBySubBreed(String breed, String subBreed) async {
    final response = await _client.get('breed/$breed/$subBreed/images');

    final dogApiResponse = DogApiResponse<List<String>>.fromJson(response.data);

    return dogApiResponse.message;
  }
}

@riverpod
FutureOr<Breeds> getAllBreeds(GetAllBreedsRef ref) {
  return ref.watch(dogApiRepositoryProvider).getAllBreeds();
}

@riverpod
FutureOr<String> getImageByBreed(GetImageByBreedRef ref, String breed) {
  return ref.watch(dogApiRepositoryProvider).getRandomImageByBreed(breed);
}

@riverpod
FutureOr<String> getImageBySubBreed(
  GetImageBySubBreedRef ref,
  String breed,
  String subBreed,
) {
  return ref.watch(dogApiRepositoryProvider).getRandomImageBySubBreed(breed, subBreed);
}

@riverpod
FutureOr<List<String>> getImagesListByBreed(GetImagesListByBreedRef ref, String breed) {
  return ref.watch(dogApiRepositoryProvider).getImagesListByBreed(breed);
}

@riverpod
FutureOr<List<String>> getImagesListBySubBreed(
  GetImagesListBySubBreedRef ref,
  String breed,
  String subBreed,
) {
  return ref.watch(dogApiRepositoryProvider).getImagesListBySubBreed(breed, subBreed);
}
