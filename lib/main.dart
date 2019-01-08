import 'package:flutter/material.dart';
import './slides.dart';

void main() => runApp(MySplashScreen());

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}


class _MySplashScreenState extends State<MySplashScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: Image.asset("assets/images/logo_512px_height.png") ,
        description: "We intends to simplify your hiring process through app so you’d find the easiness during on the go.",
        pathImage: "assets/images/slide_1.png",
        colorBegin: Color(0xff33beef),
        colorEnd: Color(0xff173155),
      ),
    );
    slides.add(
      new Slide(
        title: "PENCIL",
        description: "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/photo_pencil.png",
        colorBegin: Color(0xff33beef),
        colorEnd: Color(0xff173155),
      ),
    );
    slides.add(
      new Slide(
        title: "RULER",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "images/photo_ruler.png",
        colorBegin: Color(0xff33beef),
        colorEnd: Color(0xff173155),
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen

  }

  void onSkipPress() {
    // TODO: go to next screen
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}

