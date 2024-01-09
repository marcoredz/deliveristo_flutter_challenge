import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_flutter_challenge/src/features/random_image/services/random_image_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kNewRandomImageButton = Key('new_random_image_button');

class RandomImageSection extends ConsumerWidget {
  const RandomImageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final imageState = ref.watch(randomImageProvider);

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
              key: kNewRandomImageButton,
              icon: const FaIcon(
                FontAwesomeIcons.arrowsRotate,
                size: 16,
              ),
              onPressed: imageState.isLoading
                  ? null
                  : () {
                      ref.invalidate(randomImageProvider);
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
