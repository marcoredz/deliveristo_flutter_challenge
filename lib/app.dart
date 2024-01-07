import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme.dart';
import 'presentation/main_screen.dart';
import 'presentation/select_breed/bottom_app_bar.dart';

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
