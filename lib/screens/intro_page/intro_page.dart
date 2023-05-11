import 'package:electro_bikes/screens/intro_page/intro_page_screens/intro_page_screen_1.dart';
import 'package:electro_bikes/screens/intro_page/intro_page_screens/intro_page_screen_2.dart';
import 'package:electro_bikes/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    Key? key,
    this.sharedPreferences,
    this.seenKey,
  }) : super(key: key);
  final SharedPreferences? sharedPreferences;
  final String? seenKey;

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController controller = PageController(initialPage: 0);
  List<Widget> screenList = const <Widget>[
    IntroPageScreen1(),
    IntroPageScreen2()
  ];

  int activePage = 0;

  @override
  void initState() {
    widget.sharedPreferences?.setBool(widget.seenKey!, true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: screenList.length,
                controller: controller,
                onPageChanged: (pageIndex) {
                  setState(() {
                    activePage = pageIndex;
                  });
                },
                itemBuilder: (context, index) {
                  return screenList[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  screenList.length,
                  (listIndex) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        controller.animateToPage(listIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: activePage == listIndex
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30)
                  .copyWith(bottom: 70),
              child: CommonButton(
                text: AppStrings.next,
                onTap: () {
                  nextPage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void nextPage() {
    if (activePage < screenList.length) {
      controller.animateToPage(activePage++,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/starting-page',
        (route) => false,
      );
    }
  }
}
