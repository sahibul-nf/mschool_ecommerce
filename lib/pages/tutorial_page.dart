import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mschool_ecommerce/providers/tutorial_provider.dart' as tp;

class TutorialPage extends ConsumerStatefulWidget {
  const TutorialPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TutorialPageState();
}

class _TutorialPageState extends ConsumerState<TutorialPage> {
  @override
  void initState() {
    super.initState();
    ref.read(tp.tutorialProvider.notifier).init();
  }

  @override
  void dispose() {
    ref.read(tp.tutorialProvider.notifier).pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tutorialProvider = ref.watch(tp.tutorialProvider);

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            reverse: true,
            onPageChanged: (int newpage) {
              tutorialProvider.setCurrentPage(newpage);
            },
            scrollDirection: Axis.horizontal,
            controller: tutorialProvider.pageController,
            itemCount: tutorialProvider.pages.length,
            itemBuilder: (context, index) => tutorialProvider.pages[index],
          ),
        ),

        // skip button and smooth page indicator
        // Container(
        //   height: 45,
        //   color: Colors.grey[200],
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       TextButton(
        //         onPressed: () {
        //           tutorialProvider.setFirstTime(false);
        //         },
        //         child: const Text("Skip"),
        //       ),
        //       SmoothPageIndicator(
        //         controller: tutorialProvider.pageController,
        //         count: tutorialProvider.pages.length,
        //         textDirection: TextDirection.rtl,
        //         axisDirection: Axis.horizontal,
        //         onDotClicked: (index) {
        //           tutorialProvider.setCurrentPage(index);
        //         },
        //         effect: ExpandingDotsEffect(
        //           dotHeight: 8,
        //           dotWidth: 8,
        //           dotColor: Colors.grey.shade400,
        //           activeDotColor: Colors.blue,
        //           spacing: 5,
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
