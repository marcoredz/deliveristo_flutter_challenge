import 'package:deliveristo_flutter_challenge/core/http_client.dart';
import 'package:deliveristo_flutter_challenge/data/dog_api_response.dart';
import 'package:deliveristo_flutter_challenge/data/models/breeds.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
