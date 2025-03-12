class OnboardingModel {
  String image;
  String title;
  String? subTitle;

  OnboardingModel({required this.image, required this.title, this.subTitle});

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(image: "assets/Group1.png", title: "Welcome To Islami App"),
    OnboardingModel(
        image: "assets/Group2.png",
        title: "Welcome To Islami",
        subTitle: "We Are Very Excited To Have You In Our Community"),
    OnboardingModel(
        image: "assets/Group3.png",
        title: "Reading The Quran",
        subTitle: "Read, And Your Lord IS The Most Generous"),
    OnboardingModel(
        image: "assets/Group4.png",
        title: "Bearish",
        subTitle: "Praise The Name Of Your Lord, The Most High"),
    OnboardingModel(
        image: "assets/Group5.png",
        title: "Holy Quran Radio",
        subTitle:
            "You Can Listen To The Holy Quran Radio Through The Application For Free And Easily"),
  ];
}
