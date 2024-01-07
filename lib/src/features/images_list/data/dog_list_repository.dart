import 'package:deliveristo_flutter_challenge/src/shared/domain/models/dog_api_response.dart';
import 'package:deliveristo_flutter_challenge/src/shared/domain/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_list_repository.g.dart';

@riverpod
DogListRepository dogListRepository(DogListRepositoryRef ref) {
  return DogListRepository(ref.watch(dioProvider));
}

class DogListRepository {
  final Dio _client;

  const DogListRepository(this._client);

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
FutureOr<List<String>> getImagesListByBreed(GetImagesListByBreedRef ref, String breed) {
  return ref.watch(dogListRepositoryProvider).getImagesListByBreed(breed);
}

@riverpod
FutureOr<List<String>> getImagesListBySubBreed(
  GetImagesListBySubBreedRef ref,
  String breed,
  String subBreed,
) {
  return ref.watch(dogListRepositoryProvider).getImagesListBySubBreed(breed, subBreed);
}
