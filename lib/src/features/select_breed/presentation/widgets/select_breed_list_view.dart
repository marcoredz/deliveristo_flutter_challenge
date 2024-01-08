import 'package:deliveristo_flutter_challenge/src/features/select_breed/data/breed_list_repository.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_notifier.dart';
import 'package:deliveristo_flutter_challenge/src/shared/domain/models/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kSubBreedListTileTextKey = Key('sub_breed_list_tile_text');

class SelectBreedListView extends ConsumerWidget {
  const SelectBreedListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectBreedProvider);

    return state.breeds.when(
      data: (Breeds data) => ListView.builder(
        itemCount: data.keys.length,
        itemBuilder: (BuildContext context, int index) {
          // Current breed
          final breed = data.entries.elementAt(index);
          final subBreeds = breed.value;

          final isSelected = breed.key.toLowerCase() == state.selectedBreed?.key.toLowerCase();

          return ListTile(
            title: Text(breed.key),
            trailing: isSelected ? const Icon(Icons.check) : null,
            subtitle: (subBreeds.isNotEmpty == true)
                ? Text(
                    key: kSubBreedListTileTextKey,
                    'Sottorazze: ${subBreeds.join(', ')}',
                  )
                : null,
            onTap: () {
              ref.read(selectBreedProvider.notifier).selectBreed(breed);
              Navigator.pop(context);
            },
          );
        },
      ),
      error: (error, stackTrace) {
        // Report error
        debugPrint(error.toString());

        ref.invalidate(getAllBreedsProvider);

        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error),
              SizedBox(height: 16),
              Text('Errore durante il caricamento. Riprovare'),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
