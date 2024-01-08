import 'package:deliveristo_flutter_challenge/src/features/images_list/data/dog_list_repository.dart';
import 'package:deliveristo_flutter_challenge/src/features/main_screen.dart';
import 'package:deliveristo_flutter_challenge/src/features/random_image/data/random_dog_repository.dart';
import 'package:deliveristo_flutter_challenge/src/features/random_image/presentation/random_image_section.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/utils/mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('show random dog image and dog images list test', () {
    const selectedBreed = 'hound';
    const selectedSubBreed = 'ibizan';
    const imagesUrlList = [
      'https://images.dog.ceo/breeds/hound-english/n02089973_1352.jpg',
      'https://images.dog.ceo/breeds/hound-english/n02089973_1799.jpg',
      'https://images.dog.ceo/breeds/hound-ibizan/n02091244_4669.jpg',
      'https://images.dog.ceo/breeds/hound-ibizan/n02091244_4086.jpg',
    ];

    testWidgets(
      '''
      [success scenario]
    - select a breed from modal bottom sheet 
    - show the random dog image and the dog images list
''',
      (tester) async {
        const randomImageUrl = 'https://images.dog.ceo/breeds/hound-english/n02089973_1352.jpg';

        await tester.pumpWidget(
          ProviderScope(
            // Override so the widget test won't use Dio inside methods.
            overrides: [
              mockGetAllBreedsProvider(),
              getImageByBreedProvider(selectedBreed).overrideWith((ref) async {
                await Future.delayed(const Duration(milliseconds: 500));

                return randomImageUrl;
              }),
              getImagesListByBreedProvider(selectedBreed).overrideWith((provider) async {
                await Future.delayed(const Duration(milliseconds: 500));

                return imagesUrlList;
              }),
            ],
            child: const MaterialApp(home: MainScreen()),
          ),
        );

        // Select breed
        final selectBreedButton = find.byKey(kSelectBreedButtonKey);
        expect(selectBreedButton, findsOneWidget);

        await tester.tap(selectBreedButton);
        await tester.pumpAndSettle();

        // select the breed
        final listTile = find.text(selectedBreed);
        await tester.tap(listTile);
        await tester.pumpAndSettle();

        // check if modal is closed
        final draggableScrollSheet = find.byKey(kSelectBreedBottomSheetKey);
        expect(draggableScrollSheet, findsNothing);

        // find the random image
        final randomImage = find.byKey(const Key(randomImageUrl));
        expect(randomImage, findsAtLeastNWidgets(1));

        // find the images list
        final oneImageOfTheList = find.byKey(
          Key(imagesUrlList.firstWhere((e) => e.contains(selectedBreed))),
        );
        expect(oneImageOfTheList, findsAtLeastNWidgets(1));

        // get new random image
        final newRandomImageButton = find.byKey(kNewRandomImageButton);
        expect(newRandomImageButton, findsOneWidget);
        await tester.tap(newRandomImageButton);
        await tester.pump();

        expect(randomImage, findsAtLeastNWidgets(1));
      },
    );

    testWidgets('''
      [success scenario]
    - select a breed from modal bottom sheet
    - select a sub breed
    - show the random dog image and the dog images list
''', (tester) async {
      const randomImageUrl = 'https://images.dog.ceo/breeds/hound-ibizan/n02091244_4669.jpg';

      await tester.pumpWidget(
        ProviderScope(
          // Override so the widget test won't use Dio inside methods.
          overrides: [
            mockGetAllBreedsProvider(),
            getImageByBreedProvider(selectedBreed).overrideWith((_) async {
              await Future.delayed(const Duration(milliseconds: 500));

              return randomImageUrl;
            }),
            getImagesListByBreedProvider(selectedBreed).overrideWith((_) async {
              await Future.delayed(const Duration(milliseconds: 500));

              return imagesUrlList;
            }),
            getImageBySubBreedProvider(
              selectedBreed,
              selectedSubBreed,
            ).overrideWith((_) async {
              await Future.delayed(const Duration(milliseconds: 500));

              return randomImageUrl;
            }),
            getImagesListBySubBreedProvider(
              selectedBreed,
              selectedSubBreed,
            ).overrideWith((_) async {
              await Future.delayed(const Duration(milliseconds: 500));

              return imagesUrlList;
            }),
          ],

          child: const MaterialApp(home: MainScreen()),
        ),
      );

      // Open select breed modal
      final selectBreedButton = find.byKey(kSelectBreedButtonKey);
      expect(selectBreedButton, findsOneWidget);

      await tester.tap(selectBreedButton);
      await tester.pumpAndSettle();

      // select the breed
      final breedListTile = find.text(selectedBreed);
      await tester.tap(breedListTile);
      await tester.pumpAndSettle();

      // Open select sub breed modal
      final selectSubBreedButton = find.byKey(kSelectSubBreedButtonKey);
      expect(selectSubBreedButton, findsOneWidget);

      await tester.tap(selectSubBreedButton);
      await tester.pumpAndSettle();

      // select the sub breed
      final subBreedListTile = find.text(selectedSubBreed);
      await tester.tap(subBreedListTile);
      await tester.pumpAndSettle();

      // check if modal is closed
      final draggableScrollSheet = find.byKey(kSelectSubBreedBottomSheetKey);
      expect(draggableScrollSheet, findsNothing);

      // find the random image
      final randomImage = find.byKey(const Key(randomImageUrl));
      expect(randomImage, findsAtLeastNWidgets(1));

      // find the images list
      final oneImageOfTheList = find.byKey(
        Key(imagesUrlList.firstWhere((e) => e.contains(selectedSubBreed))),
      );
      expect(oneImageOfTheList, findsAtLeastNWidgets(1));

      // get new random image
      final newRandomImageButton = find.byKey(kNewRandomImageButton);
      expect(newRandomImageButton, findsOneWidget);
      await tester.tap(newRandomImageButton);
      await tester.pump();

      expect(randomImage, findsAtLeastNWidgets(1));
    });
  });
}
