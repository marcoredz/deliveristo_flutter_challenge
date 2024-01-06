import 'package:deliveristo_flutter_challenge/data/dog_api_repository.dart';
import 'package:deliveristo_flutter_challenge/data/models/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getAllBreedsProvider);

    return state.when(
      data: (Breeds data) => ListView.builder(
        itemCount: data.keys.length,
        itemBuilder: (BuildContext context, int index) {
          final key = data.keys.elementAt(index);
          final values = data[key];

          return ListTile(
            title: Text(key),
            subtitle: Text('Valori: ${values?.join(', ')}'),
          );
        },
      ),
      error: (error, stackTrace) {
        print(error.toString());
        return Text(error.toString());
      },
      loading: () => const CircularProgressIndicator(),
    );
  }
}
