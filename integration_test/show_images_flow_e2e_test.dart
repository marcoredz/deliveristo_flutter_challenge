import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveristo_flutter_challenge/src/features/images_list/presentation/images_list_section.dart';
import 'package:deliveristo_flutter_challenge/src/features/main_screen.dart';
import 'package:deliveristo_flutter_challenge/src/features/random_image/presentation/random_image_section.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/bottom_app_bar.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/widgets/select_breed_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('[e2e] show random dog image and dog images list test', () {
    testWidgets(
      '''
      [success scenario]
    - select a breed from modal bottom sheet 
    - show the random dog image and the dog images list
''',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: MainScreen()),
          ),
        );

        // Select breed
        final selectBreedButton = find.byKey(kSelectBreedButtonKey);
        expect(selectBreedButton, findsOneWidget);

        await tester.tap(selectBreedButton);
        await tester.pumpAndSettle();

        // select the breed
        final listTile = find.byType(ListTile);

        await tester.tap(listTile.first);
        await tester.pumpAndSettle();

        // check if modal is closed
        final draggableScrollSheet = find.byKey(kSelectBreedBottomSheetKey);
        expect(draggableScrollSheet, findsNothing);

        // find the random image
        // find first the random image section
        final randomImageSection = find.byType(RandomImageSection);
        expect(randomImageSection, findsOneWidget);

        // Find the CachedNetworkImage widget under the RandomImageSection
        final randomImage = find.descendant(
          of: randomImageSection,
          matching: find.byType(CachedNetworkImage),
        );
        expect(randomImage, findsOneWidget);

        // find the images list
        // find first the images list section
        final imagesListSection = find.byType(ImagesListSection);
        expect(imagesListSection, findsOneWidget);
        final oneImageOfTheList = find.descendant(
          of: imagesListSection,
          matching: find.byType(CachedNetworkImage),
        );
        expect(oneImageOfTheList, findsAtLeastNWidgets(1));

        // get new random image
        final newRandomImageButton = find.byKey(kNewRandomImageButton);
        expect(newRandomImageButton, findsOneWidget);
        await tester.tap(newRandomImageButton);
        await tester.pump();

        expect(randomImage, findsOneWidget);
      },
      skip: true,
    );

    testWidgets('''
      [success scenario]
    - select a breed from modal bottom sheet
    - select a sub breed
    - show the random dog image and the dog images list
''', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: MainScreen()),
        ),
      );

      // Open select breed modal
      final selectBreedButton = find.byKey(kSelectBreedButtonKey);
      expect(selectBreedButton, findsOneWidget);

      await tester.tap(selectBreedButton);
      await tester.pumpAndSettle();

      final listViewFinder = find.byType(ListView);

      // select the breed with a sub breed
      final breedListTile = find.byKey(kSubBreedListTileTextKey);
      // final breedListTile = find.text('hound');

      // scroll until find the tile with the sub breed
      await tester.dragUntilVisible(
        breedListTile,
        listViewFinder,
        const Offset(0, -300),
      );

      await tester.tap(breedListTile);
      await tester.pumpAndSettle();

      // open select sub breed modal
      final selectSubBreedButton = find.byKey(kSelectSubBreedButtonKey);
      expect(selectSubBreedButton, findsOneWidget);

      await tester.tap(selectSubBreedButton);
      await tester.pumpAndSettle();

      // select the sub breed
      final listTile = find.byType(ListTile);
      assert(!listTile.hasFound, 'ListTile not found');

      await tester.tap(listTile.first);
      await tester.pumpAndSettle();

      // check if modal is closed
      final draggableScrollSheet = find.byKey(kSelectSubBreedBottomSheetKey);
      expect(draggableScrollSheet, findsNothing);

      // find the random image
      // find first the random image section
      final randomImageSection = find.byType(RandomImageSection);
      expect(randomImageSection, findsOneWidget);

      // find the CachedNetworkImage widget under the RandomImageSection
      final randomImage = find.descendant(
        of: randomImageSection,
        matching: find.byType(CachedNetworkImage),
      );
      expect(randomImage, findsOneWidget);

      // find the images list
      // find first the images list section
      final imagesListSection = find.byType(ImagesListSection);
      expect(imagesListSection, findsOneWidget);
      final oneImageOfTheList = find.descendant(
        of: imagesListSection,
        matching: find.byType(CachedNetworkImage),
      );
      expect(oneImageOfTheList, findsAtLeastNWidgets(1));

      // get new random image
      final newRandomImageButton = find.byKey(kNewRandomImageButton);
      expect(newRandomImageButton, findsOneWidget);
      await tester.tap(newRandomImageButton);
      await tester.pump();

      expect(randomImage, findsOneWidget);
    }, skip: false);
  });
}
