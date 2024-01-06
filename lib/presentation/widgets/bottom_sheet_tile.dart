import 'package:flutter/material.dart';

class BottomSheetTile extends StatelessWidget {
  const BottomSheetTile({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth / 3,
        height: 5,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      );
    });
  }
}
