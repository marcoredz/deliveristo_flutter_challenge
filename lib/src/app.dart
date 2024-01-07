import 'package:deliveristo_flutter_challenge/src/features/main_screen.dart';
import 'package:deliveristo_flutter_challenge/src/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: appTheme,
        home: const MainScreen(),
      ),
    );
  }
}
