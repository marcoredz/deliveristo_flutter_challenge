import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_flutter_challenge/src/core/utils/multi_sliver_widget/multi_sliver_widget.dart';
import 'package:deliveristo_flutter_challenge/src/data/dog_api_repository.dart';
import 'package:deliveristo_flutter_challenge/src/presentation/select_breed/select_breed_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _imagesListProvider = FutureProvider.autoDispose<List<String>>((ref) async {
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

class ImagesListSection extends ConsumerWidget {
  const ImagesListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final listState = ref.watch(_imagesListProvider);

    return listState.when(
      data: (imagesList) => MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                const FaIcon(FontAwesomeIcons.list),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Lista di immagini',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Text('Numero: ${imagesList.length}'),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
            itemBuilder: (context, index) {
              final imageUrl = imagesList[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  key: Key(imageUrl),
                  cacheKey: imageUrl,
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: FaIcon(FontAwesomeIcons.image),
                  ),
                  errorWidget: (context, url, error) {
                    debugPrint(error.toString());

                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.circleExclamation),
                          SizedBox(height: 8),
                          Text('Immagine non caricata'),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            itemCount: imagesList.length,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
      error: (error, stackTrace) => SliverToBoxAdapter(child: Text(error.toString())),
      loading: () => const SliverToBoxAdapter(
        child: SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
