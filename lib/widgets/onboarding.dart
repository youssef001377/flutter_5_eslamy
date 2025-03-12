import 'package:flutter/material.dart';
import 'package:flutter_5_eslamy/utils/services/local_storage_key.dart';
import 'package:flutter_5_eslamy/utils/services/local_storage_service.dart';
import 'package:flutter_5_eslamy/widgets/onboarding_item.dart';
import 'package:flutter_5_eslamy/widgets/onboarding_model.dart';
import 'package:flutter_5_eslamy/widgets/sepha.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  static const String routeName = 'Onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int activeIndex = 0;
  var controller = PageController();

  @override
  void initState() {
    super.initState();
    _markOnboardingAsSeen();
  }

  Future<void> _markOnboardingAsSeen() async {
    await LocalStorageService.setBool(LocalStorageKey.isFirstTime, false);
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SizedBox(height: 35),
        SizedBox(
          height: 150,
          child: Image.asset("assets/Logo.png"),
        ),
        Expanded(
          child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                activeIndex = index;
                setState(() {});
              },
              itemCount: OnboardingModel.onboardingList.length,
              itemBuilder: (context, index) {
                return OnboardingItem(
                  model: OnboardingModel.onboardingList[index],
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Visibility(
                visible: activeIndex != 0,
                child: TextButton(
                    onPressed: () {
                      controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                          color: Color(0xFFE2BE7F),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: OnboardingModel.onboardingList.length,
              effect: ExpandingDotsEffect(
                dotColor: Color(0xFF707070),
                activeDotColor: Color(0xFFE2BE7F),
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () async {
                    if (activeIndex ==
                        OnboardingModel.onboardingList.length - 1) {
                      await LocalStorageService.setBool('onboardingSeen', true);

                      Navigator.pushReplacementNamed(context, Sebha.routeName);
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    activeIndex == OnboardingModel.onboardingList.length - 1
                        ? "Finish"
                        : "Next",
                    style: TextStyle(
                        color: Color(0xFFE2BE7F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
