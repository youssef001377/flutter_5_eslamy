import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  static const String routeName = '/sebha';

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  double angle = 0;
  int index = 0;
  List<String> list = [
    "سبحان الله",
    "الحمد لله",
    "الله واكبر",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Expanded(
                child: Image.asset(
              "assets/SebhaBackground.png",
              fit: BoxFit.cover,
            )),
          ],
        ),
        Image.asset("assets/Logo.png"),
        Stack(
          children: [
            GestureDetector(
              onTap: ontap,
              child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.01, top: size.height * 0.34),
                  height: 410,
                  width: 500,
                  child: Transform.rotate(
                      angle: angle,
                      child: Image.asset("assets/SebhaBody.png"))),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.26, left: size.width * 0.44),
              child: Image.asset("assets/SebhaHead.png"),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.47, left: size.width * 0.34),
              child: Text(
                list[index],
                style: TextStyle(
                    fontSize: 37,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.58, left: size.width * 0.46),
              child: Text(
                counter.toString(),
                style: TextStyle(
                    fontSize: 37,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        )
      ],
    );
  }

  ontap() {
    angle += 5;
    counter++;
    setState(() {
      if (counter ==33){
        counter = 0;
        index ++;

      }
      if (index ==3){
        index = 0;
      }

    });
  }
}
