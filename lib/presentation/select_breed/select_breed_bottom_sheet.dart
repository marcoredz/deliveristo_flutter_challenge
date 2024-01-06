import 'package:deliveristo_flutter_challenge/presentation/select_breed/select_breed_notifier.dart';
import 'package:deliveristo_flutter_challenge/presentation/widgets/bottom_sheet_tile.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/select_breed_list_view.dart';

class SelectBreedBottomSheet extends ConsumerStatefulWidget {
  const SelectBreedBottomSheet({super.key});

  @override
  ConsumerState<SelectBreedBottomSheet> createState() => _SelectBreedBottomSheetState();
}

class _SelectBreedBottomSheetState extends ConsumerState<SelectBreedBottomSheet> {
  late final TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController(
      text: ref.read(selectBreedProvider).searchText,
    );
    super.initState();
  }

  void onChangedEvent(String value) {
    EasyDebounce.debounce(
      'search-bar-debouncer',
      // if value is empty: no need to debounce
      Duration(milliseconds: value.isEmpty ? 0 : 300),
      () {
        ref.read(selectBreedProvider.notifier).filterBreedsByName(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
            SearchBar(
              controller: searchTextController,
              onChanged: onChangedEvent,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              trailing: [
                IconButton(
                  onPressed: () {
                    searchTextController.clear();
                    onChangedEvent('');
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
            const SizedBox(height: spacing),
            const Expanded(
              child: SelectBreedListView(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }
}
