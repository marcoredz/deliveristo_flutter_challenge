import 'package:deliveristo_flutter_challenge/src/features/images_list/presentation/images_list_section.dart';
import 'package:deliveristo_flutter_challenge/src/features/random_image/presentation/random_image_section.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/bottom_app_bar.dart';
import 'package:deliveristo_flutter_challenge/src/features/select_breed/presentation/select_breed_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final ScrollController scrollController;
  bool showBackToTopButton = false;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (scrollController.offset >= 400) {
            showBackToTopButton = true;
          } else {
            showBackToTopButton = false;
          }
        });
      });

    super.initState();
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deliveristo Challenge'),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final selectBreedState = ref.watch(
            selectBreedProvider.select((state) => state.selectedBreed),
          );

          if (selectBreedState == null) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Center(
                child: Text(
                  'Seleziona una razza per mostrare le opzioni!',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomScrollView(
              controller: scrollController,
              slivers: const [
                SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: RandomImageSection(),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 32)),
                ImagesListSection(),
              ],
            ),
          );
        },
      ),
      floatingActionButton: showBackToTopButton == false
          ? const SizedBox.shrink()
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward),
            ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
