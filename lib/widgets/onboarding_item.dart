import 'package:flutter/cupertino.dart';
import 'package:flutter_5_eslamy/widgets/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          model.image,
          height: size.height * 0.50,
        ),
        Text(model.title,style: TextStyle(color: Color(0xFFE2BE7F),fontSize: 24, fontWeight: FontWeight.bold),),
        Text(model.subTitle ?? "",style: TextStyle(color: Color(0xFFE2BE7F),fontSize: 22,fontWeight: FontWeight.bold),),
      ],
    );
  }
}
