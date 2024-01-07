import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'select_breed_bottom_sheet.dart';
import 'select_breed_notifier.dart';
import 'select_subbreed_bottom_sheet.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
      ),
      child: Consumer(builder: (context, ref, _) {
        final selectedBreed = ref.watch(
          selectBreedProvider.select((state) => state.selectedBreed),
        );
        final selectedSubBreed = ref.watch(
          selectBreedProvider.select((state) => state.selectedSubBreed),
        );
        return Row(
          children: [
            Expanded(
              child: TextButton(
                child: Text(selectedBreed != null ? selectedBreed.key : 'Scegli la razza'),
                onPressed: () {
                  ref.read(selectBreedProvider.notifier).loadBreeds();

                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const SelectBreedBottomSheet();
                    },
                    useSafeArea: true,
                    isScrollControlled: true,
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextButton(
                onPressed: selectedBreed != null && selectedBreed.value.isNotEmpty
                    ? () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SelectSubBreedBottomSheet(
                              subBreeds: selectedBreed.value,
                              selectedSubBreed: selectedSubBreed,
                            );
                          },
                          useSafeArea: true,
                        );
                      }
                    : null,
                child: Text(
                  selectedSubBreed ?? 'Scegli la sottorazza',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
