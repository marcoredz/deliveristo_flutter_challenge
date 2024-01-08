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

  @override
  String toString() {
    return 'SelectBreedState(breeds: $breeds, selectedBreed: $selectedBreed, selectedSubBreed: $selectedSubBreed, searchText: $searchText)';
  }

  @override
  bool operator ==(covariant SelectBreedState other) {
    if (identical(this, other)) return true;

    return other.breeds == breeds &&
        other.selectedBreed == selectedBreed &&
        other.selectedSubBreed == selectedSubBreed &&
        other.searchText == searchText;
  }

  @override
  int get hashCode {
    return breeds.hashCode ^
        selectedBreed.hashCode ^
        selectedSubBreed.hashCode ^
        searchText.hashCode;
  }
}
