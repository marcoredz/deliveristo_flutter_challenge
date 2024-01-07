import 'package:deliveristo_flutter_challenge/src/shared/domain/models/breeds.dart';
import 'package:deliveristo_flutter_challenge/src/shared/domain/models/dog_api_response.dart';
import 'package:deliveristo_flutter_challenge/src/shared/domain/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'breed_list_repository.g.dart';

final breedListRepositoryProvider = Provider<BreedListRepository>(
  (ref) => BreedListRepository(ref.watch(dioProvider)),
);

class BreedListRepository {
  final Dio _client;

  const BreedListRepository(this._client);

  Future<Breeds> getAllBreeds() async {
    final response = await _client.get('breeds/list/all');

    final dogApiResponse = DogApiResponse<Breeds>.fromJson(response.data);

    return dogApiResponse.message;
  }
}

@riverpod
FutureOr<Breeds> getAllBreeds(GetAllBreedsRef ref) {
  return ref.watch(breedListRepositoryProvider).getAllBreeds();
}
