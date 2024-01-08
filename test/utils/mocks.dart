import 'package:deliveristo_flutter_challenge/src/features/select_breed/data/breed_list_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Override mockGetAllBreedsProvider() => getAllBreedsProvider.overrideWith(
      (ref) async {
        await Future.delayed(const Duration(milliseconds: 100));

        return {
          'appenzeller': [],
          'australian': ['shepherd'],
          'labrador': [],
        };
      },
    );
