import 'package:deliveristo_flutter_challenge/src/core/theme.dart';
import 'package:deliveristo_flutter_challenge/src/presentation/main_screen.dart';
import 'package:deliveristo_flutter_challenge/src/presentation/select_breed/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: appTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Deliveristo Challenge'),
            centerTitle: true,
          ),
          body: const MainScreen(),
          floatingActionButton: const SizedBox.shrink(),
          bottomNavigationBar: const CustomBottomAppBar(),
        ),
      ),
    );
  }
}
