import 'package:deliveristo_flutter_challenge/src/features/select_breed/data/breed_list_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockBreedListRepository extends Mock implements BreedListRepository {}

/// Util method to mock the getAllBreeds method of BreedListRepository
void mockGetAllBreeds(MockBreedListRepository repository) =>
    when(repository.getAllBreeds).thenAnswer(
      (_) => Future.value({
        'appenzeller': [],
        'australian': ['shepherd'],
        'labrador': [],
        'hound': [
          'afghan',
          'basset',
          'blood',
          'english',
          'ibizan',
          'plott',
          'walker',
        ],
      }),
    );
