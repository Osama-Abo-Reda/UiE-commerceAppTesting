import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../modules/welcomes_screens/welcome_screen.dart';
import '../shared/components/widgets.dart';
import '../shared/network/local/cache_helper.dart';
import '../shared/styles/colors.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onBoarding1.png',
      title: 'On Board Title 1',
      body: 'On Board Body 1',
    ),
    BoardingModel(
      image: 'assets/images/onBoarding2.png',
      title: 'On Board Title 2',
      body: 'On Board Body 2',
    ),
    BoardingModel(
      image: 'assets/images/onBoarding3.png',
      title: 'On Board Title 3',
      body: 'On Board Body 3',
    ),
  ];
  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    void submitCompeleteShownBoarding() {
      CacheHelper.writeData(key: 'onBoarding', value: true).then((value) {
        if (value) navigateAndFinish(context, const WelcomeScreen());
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submitCompeleteShownBoarding,
            child: const Padding(
              padding: EdgeInsets.only(
                right: 18,
              ),
              child: Text(
                'SKIP',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) => buildBoardingItem(
                  boarding[index],
                ),
                itemCount: boarding.length,
                onPageChanged: (value) {
                  if (value == boarding.length - 1) {
                    //setstate
                    isLast = true;
                    print('last Screen');
                  } else {
                    //setatate
                    isLast = false;
                    print('not last Screen');
                  }
                },
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: defaultColor,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submitCompeleteShownBoarding();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.linearToEaseOut,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            model.title,
            style: GoogleFonts.abrilFatface(
              textStyle: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.body,
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
}
