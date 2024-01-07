import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_flutter_challenge/src/data/dog_api_repository.dart';
import 'package:deliveristo_flutter_challenge/src/presentation/select_breed/select_breed_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _randomImageProvider = FutureProvider.autoDispose<String>((ref) async {
  final selectedBreed = ref.watch(selectBreedProvider.select((state) => state.selectedBreed));
  if (selectedBreed == null) return '';

  final selectedSubBreed = ref.watch(selectBreedProvider.select((state) => state.selectedSubBreed));

  if (selectedSubBreed == null) {
    final imageUrl = await ref.read(getImageByBreedProvider(selectedBreed.key).future);
    return imageUrl;
  }

  final imageUrl = await ref.read(getImageBySubBreedProvider(
    selectedBreed.key,
    selectedSubBreed,
  ).future);

  return imageUrl;
});

class RandomImageSection extends ConsumerWidget {
  const RandomImageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final imageState = ref.watch(_randomImageProvider);

    return Column(
      children: [
        Row(
          children: [
            const FaIcon(FontAwesomeIcons.dice),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Genera un immagine casuale',
                style: theme.textTheme.titleMedium,
              ),
            ),
            ElevatedButton.icon(
              icon: const FaIcon(
                FontAwesomeIcons.arrowsRotate,
                size: 16,
              ),
              onPressed: imageState.isLoading
                  ? null
                  : () {
                      ref.invalidate(_randomImageProvider);
                    },
              label: const Text('Nuova'),
            )
          ],
        ),
        const SizedBox(height: 8),
        imageState.when(
          data: (imageUrl) => ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              key: Key(imageUrl),
              cacheKey: imageUrl,
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Text(error.toString()),
        )
      ],
    );
  }
}
