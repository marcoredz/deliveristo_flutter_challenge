import 'package:deliveristo_flutter_challenge/src/shared/domain/models/breeds.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectBreedState {
  final AsyncValue<Breeds> breeds;
  final MapEntry<String, List<String>>? selectedBreed;
  final String? selectedSubBreed;

  final String searchText;

  const SelectBreedState({
    this.breeds = const AsyncData({}),
    this.selectedBreed,
    this.selectedSubBreed,
    this.searchText = '',
  });

  SelectBreedState copyWith({
    AsyncValue<Breeds>? breeds,
    MapEntry<String, List<String>>? selectedBreed,
    String? selectedSubBreed,
    String? searchText,
  }) {
    return SelectBreedState(
      breeds: breeds ?? this.breeds,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      selectedSubBreed: selectedSubBreed ?? this.selectedSubBreed,
      searchText: searchText ?? this.searchText,
    );
  }
}
