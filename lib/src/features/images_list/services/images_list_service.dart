import 'package:deliveristo_flutter_challenge/src/features/images_list/data/dog_list_repository.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imagesListProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final selectedBreed = ref.watch(selectBreedProvider.select((state) => state.selectedBreed));
  if (selectedBreed == null) return [];

  final selectedSubBreed = ref.watch(selectBreedProvider.select((state) => state.selectedSubBreed));

  if (selectedSubBreed == null) {
    final imagesList = await ref.read(getImagesListByBreedProvider(selectedBreed.key).future);
    return imagesList;
  }

  final imageUrl = await ref.read(getImagesListBySubBreedProvider(
    selectedBreed.key,
    selectedSubBreed,
  ).future);

  return imageUrl;
});
