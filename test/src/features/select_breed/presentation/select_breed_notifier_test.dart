import 'package:deliveristo_flutter_challenge/src/features/select_breed/data/breed_list_repository.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_notifier.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mocks.dart';
import '../../../../utils/utils.dart';

void main() {
  late final MockBreedListRepository mockBreedListRepository;

  setUpAll(() {
    mockBreedListRepository = MockBreedListRepository();
  });

  group('SelectBreed notifier -', () {
    test(
        '''selectBreed should update selectedBreed 
            and set to null selectedSubBreed
        ''',
        () {
      final container = createContainer();

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
          breedListRepositoryProvider.overrideWith((ref) => mockBreedListRepository),
        ],
      );

      mockGetAllBreeds(mockBreedListRepository);

      final selectBreedNotifier = container.read(selectBreedProvider.notifier);

      await selectBreedNotifier.loadBreeds();

      selectBreedNotifier.filterBreedsByName('Lab');

      final filteredBreeds = selectBreedNotifier.state.breeds.requireValue;
      expect(filteredBreeds.keys.toList(), ['labrador']);
      expect(selectBreedNotifier.state.searchText, 'Lab');
    });

    test(
        '''filterBreedsByName should filter breeds by breed name (case-insensitive) 
            even when the user is deleting letters after an empty result search
        ''',
        () async {
      final container = createContainer(
        overrides: [
          breedListRepositoryProvider.overrideWith((ref) => mockBreedListRepository),
        ],
      );

      mockGetAllBreeds(mockBreedListRepository);

      final selectBreedNotifier = container.read(selectBreedProvider.notifier);

      await selectBreedNotifier.loadBreeds();

      // digit a breed query that doesn't find any breed
      selectBreedNotifier.filterBreedsByName('Labt');
      final filteredBreeds = selectBreedNotifier.state.breeds.requireValue;
      // expect to find nothing
      expect(filteredBreeds.keys.toList(), []);

      // simulate a canc action
      selectBreedNotifier.filterBreedsByName('lab');
      final newFilteredBreeds = selectBreedNotifier.state.breeds.requireValue;
      // expect to find the breed
      expect(newFilteredBreeds.keys.toList(), ['labrador']);
    });
  });
}
