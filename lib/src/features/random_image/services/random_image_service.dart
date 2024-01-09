import 'package:deliveristo_flutter_challenge/src/features/random_image/data/random_dog_repository.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Return the URL of a random image for a selected breed.
final randomImageProvider = FutureProvider.autoDispose<String>((ref) async {
  final selectedBreed = ref.watch(selectBreedProvider.select((state) => state.selectedBreed));
  if (selectedBreed == null) return '';

  final selectedSubBreed = ref.watch(selectBreedProvider.select((state) => state.selectedSubBreed));

  // If no sub-breed is selected, get an image URL for the selected breed
  if (selectedSubBreed == null) {
    final imageUrl = await ref.read(getImageByBreedProvider(selectedBreed.key).future);
    return imageUrl;
  }

  // If a sub-breed is selected, get an image URL for the specific sub-breed
  final imageUrl = await ref.read(getImageBySubBreedProvider(
    selectedBreed.key,
    selectedSubBreed,
  ).future);

  return imageUrl;
});
