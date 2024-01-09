import 'package:deliveristo_flutter_challenge/src/features/images_list/data/dog_list_repository.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Return a list of image URLs for a selected breed or sub-breed.
final imagesListProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  final selectedBreed = ref.watch(selectBreedProvider.select((state) => state.selectedBreed));
  if (selectedBreed == null) return [];

  final selectedSubBreed = ref.watch(selectBreedProvider.select((state) => state.selectedSubBreed));

  // If no sub-breed is selected, get a list of image URLs for the selected breed
  if (selectedSubBreed == null) {
    final imagesUrlList = await ref.read(getImagesListByBreedProvider(selectedBreed.key).future);
    return imagesUrlList;
  }

  // If a sub-breed is selected, get a list of image URLs for the specific sub-breed
  final imagesUrlList = await ref.read(getImagesListBySubBreedProvider(
    selectedBreed.key,
    selectedSubBreed,
  ).future);

  return imagesUrlList;
});
