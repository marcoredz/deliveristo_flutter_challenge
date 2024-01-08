import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_notifier.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mocks.dart';
import '../../../../utils/utils.dart';

void main() {
  group('SelectBreed notifier -', () {
    test('''selectBreed should update selectedBreed 
            and set to null selectedSubBreed
        ''', () async {
      final container = createContainer(
        overrides: [
          mockGetAllBreedsProvider(),
        ],
      );

      final selectBreedNotifier = container.read(selectBreedProvider.notifier);
      const breed = MapEntry('labrador', <String>[]);

      const SelectBreedState dirtyState = SelectBreedState(
        selectedBreed: breed,
        selectedSubBreed: 'sub breed',
      );
      selectBreedNotifier.state = dirtyState;

      selectBreedNotifier.selectBreed(breed);

      expect(selectBreedNotifier.state.selectedBreed, breed);
      expect(selectBreedNotifier.state.selectedSubBreed, null);
    });

    test('filterBreedsByName should filter breeds by breed name (case-insensitive)', () async {
      final container = createContainer(
        overrides: [
          mockGetAllBreedsProvider(),
        ],
      );
      final selectBreedNotifier = container.read(selectBreedProvider.notifier);

      await selectBreedNotifier.loadBreeds();

      selectBreedNotifier.filterBreedsByName('Lab');

      final filteredBreeds = selectBreedNotifier.state.breeds.requireValue;
      expect(filteredBreeds.keys.toList(), ['labrador']);
      expect(selectBreedNotifier.state.searchText, 'Lab');
    });
  });
}
