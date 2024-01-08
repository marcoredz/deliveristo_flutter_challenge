import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mocks.dart';

void main() {
  testWidgets('''
when pressing on "select breed" button, show the modal bottom sheet.
then, when pressing on search bar back arrow, close the modal.
''', (tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        // Override getAllBreedsProvider so the widget test won't use Dio inside 'loadBreeds' method.
        container: ProviderContainer(overrides: [mockGetAllBreedsProvider()]),
        child: const MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomAppBar(),
          ),
        ),
      ),
    );

    // Open the modal

    final selectBreedButton = find.byKey(const Key('select_breed_button'));
    expect(selectBreedButton, findsOneWidget);

    // Press on the button
    await tester.tap(selectBreedButton);
    await tester.pumpAndSettle();

    final draggableScrollSheet = find.byKey(const Key('select_breed_draggable_scroll_sheet'));
    expect(draggableScrollSheet, findsOneWidget);

    // Close the modal

    final backArrow = find.byIcon(Icons.arrow_back);
    expect(backArrow, findsOneWidget);

    // Press on search bar back arrow
    await tester.tap(backArrow);
    await tester.pumpAndSettle();

    expect(draggableScrollSheet, findsNothing);
  });
}
