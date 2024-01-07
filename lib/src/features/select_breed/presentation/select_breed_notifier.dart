import 'package:deliveristo_flutter_challenge/src/features/select_breed/data/breed_list_repository.dart';
import 'package:deliveristo_flutter_challenge/src/shared/domain/models/breeds.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'select_breed_state.dart';

part 'select_breed_notifier.g.dart';

@riverpod
class SelectBreed extends _$SelectBreed {
  @override
  SelectBreedState build() {
    // Initial state
    return const SelectBreedState();
  }

  Future<void> loadBreeds() async {
    // Preserve previous text search
    if (state.breeds.requireValue.isNotEmpty) return;

    state = state.copyWith(
      breeds: const AsyncLoading(),
    );

    state = state.copyWith(
      breeds: await AsyncValue.guard(() => ref.watch(getAllBreedsProvider.future)),
    );
  }

  void selectBreed(Breed breed) {
    state = SelectBreedState(
      breeds: state.breeds,
      selectedBreed: breed,
      searchText: state.searchText,
    );
  }

  void selectSubBreed(String subBreed) {
    state = state.copyWith(selectedSubBreed: subBreed);
  }

  void updateSearchText(String searchText) {
    state = state.copyWith(searchText: searchText);
  }

  void filterBreedsByName(String name) {
    final breeds = state.breeds.requireValue;

    // If the user clear the search text, get all the breeds
    if (name.isEmpty) {
      state = state.copyWith(
        breeds: ref.watch(getAllBreedsProvider),
        searchText: '',
      );
      return;
    }

    // Filter the map entries by name
    final filteredBreeds = breeds.entries.where(
      (entry) => entry.key.toLowerCase().contains(name.toLowerCase()),
    );

    state = state.copyWith(
      breeds: AsyncData(Map.fromEntries(filteredBreeds)),
      searchText: name,
    );
  }
}
