import 'package:deliveristo_flutter_challenge/src/features/select_breed/data/breed_list_repository.dart';
import 'package:deliveristo_flutter_challenge/src/shared/domain/models/breeds.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'select_breed_state.dart';

part 'select_breed_notifier.g.dart';

@riverpod
class SelectBreed extends _$SelectBreed {
  Breeds _originalBreeds = {};

  late final BreedListRepository _breedListRepository;

  @override
  SelectBreedState build() {
    _breedListRepository = ref.watch(breedListRepositoryProvider);

    // Initial state
    return const SelectBreedState();
  }

  Future<void> loadBreeds() async {
    // Preserve previous text search
    if (!state.breeds.hasError && state.breeds.requireValue.isNotEmpty) return;

    state = state.copyWith(breeds: const AsyncLoading());

    state = state.copyWith(
      breeds: await AsyncValue.guard(() => _breedListRepository.getAllBreeds()),
    );

    if (state.breeds.hasError) return;

    _originalBreeds = state.breeds.requireValue;
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
    // If the user clear the search text, get all the breeds
    if (name.isEmpty) {
      state = state.copyWith(
        breeds: AsyncData(_originalBreeds),
        searchText: '',
      );
      return;
    }

    // Filter the map entries by name
    final filteredBreeds = _originalBreeds.entries.where(
      (entry) => entry.key.toLowerCase().contains(name.toLowerCase()),
    );

    state = state.copyWith(
      breeds: AsyncData(Map.fromEntries(filteredBreeds)),
      searchText: name,
    );
  }
}
