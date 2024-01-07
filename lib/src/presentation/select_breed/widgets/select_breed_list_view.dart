import 'package:deliveristo_flutter_challenge/src/data/dog_api_repository.dart';
import 'package:deliveristo_flutter_challenge/src/data/models/breeds.dart';
import 'package:deliveristo_flutter_challenge/src/presentation/select_breed/select_breed_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            subtitle:
                (subBreeds.isNotEmpty == true) ? Text('Sottorazze: ${subBreeds.join(', ')}') : null,
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
