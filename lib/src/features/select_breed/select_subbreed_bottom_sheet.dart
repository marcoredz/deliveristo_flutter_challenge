import 'package:deliveristo_flutter_challenge/src/shared/widgets/bottom_sheet_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'select_breed_notifier.dart';

class SelectSubBreedBottomSheet extends ConsumerWidget {
  const SelectSubBreedBottomSheet({
    super.key,
    this.subBreeds = const [],
    this.selectedSubBreed,
  });

  final List<String> subBreeds;
  final String? selectedSubBreed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const paddingValue = 16.0;
    const spacing = 16.0;

    return DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: Column(
          children: [
            const BottomSheetTile(),
            const SizedBox(height: spacing * 2),
            Expanded(
              child: ListView.builder(
                itemCount: subBreeds.length,
                itemBuilder: (BuildContext context, int index) {
                  final subBreed = subBreeds[index];

                  final isSelected = subBreed.toLowerCase() == selectedSubBreed?.toLowerCase();

                  return ListTile(
                    title: Text(subBreed),
                    trailing: isSelected ? const Icon(Icons.check) : null,
                    onTap: () {
                      ref.read(selectBreedProvider.notifier).selectSubBreed(subBreed);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
