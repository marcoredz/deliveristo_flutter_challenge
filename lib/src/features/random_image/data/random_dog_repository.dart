import 'package:deliveristo_flutter_challenge/src/shared/domain/models/dog_api_response.dart';
import 'package:deliveristo_flutter_challenge/src/shared/domain/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_dog_repository.g.dart';

final randomDogRepositoryProvider = Provider<DogApiRepository>(
  (ref) => DogApiRepository(ref.watch(dioProvider)),
);

class DogApiRepository {
  final Dio _client;

  const DogApiRepository(this._client);

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
FutureOr<String> getImageByBreed(GetImageByBreedRef ref, String breed) {
  return ref.watch(randomDogRepositoryProvider).getRandomImageByBreed(breed);
}

@riverpod
FutureOr<String> getImageBySubBreed(
  GetImageBySubBreedRef ref,
  String breed,
  String subBreed,
) {
  return ref.watch(randomDogRepositoryProvider).getRandomImageBySubBreed(breed, subBreed);
}
