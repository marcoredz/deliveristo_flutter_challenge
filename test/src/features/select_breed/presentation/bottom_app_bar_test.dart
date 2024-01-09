import 'package:deliveristo_flutter_challenge/src/features/select_breed/data/breed_list_repository.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/bottom_app_bar.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mocks.dart';

void main() {
  late final MockBreedListRepository mockBreedListRepository;

  setUp(() {
    mockBreedListRepository = MockBreedListRepository();
  });

  testWidgets(
      '''
when pressing on "select breed" button, show the modal bottom sheet.
then, when pressing on search bar back arrow, close the modal.
''',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          breedListRepositoryProvider.overrideWith((ref) => mockBreedListRepository),
        ],
        child: const MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomAppBar(),
          ),
        ),
      ),
    );

    mockGetAllBreeds(mockBreedListRepository);

    // Open the modal

    final selectBreedButton = find.byKey(kSelectBreedButtonKey);
    expect(selectBreedButton, findsOneWidget);

    // Press on the button
    await tester.tap(selectBreedButton);
    await tester.pumpAndSettle();

    final draggableScrollSheet = find.byKey(kSelectBreedBottomSheetKey);
    expect(draggableScrollSheet, findsOneWidget);

    // Close the modal

    final backArrow = find.byKey(kSelectBreedBottomSheetArrowBackKey);
    expect(backArrow, findsOneWidget);

    // Press on search bar back arrow
    await tester.tap(backArrow);
    await tester.pumpAndSettle();

    expect(draggableScrollSheet, findsNothing);
  });
}
