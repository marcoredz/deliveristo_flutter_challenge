import 'package:deliveristo_flutter_challenge/presentation/select_breed/select_breed_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'random_image/random_image_section.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectBreedState = ref.watch(
      selectBreedProvider.select((state) => state.selectedBreed),
    );

    if (selectBreedState == null) {
      return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            'Seleziona una razza per mostrare le opzioni!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            RandomImageSection(),
          ],
        ),
      ),
    );
  }
}
