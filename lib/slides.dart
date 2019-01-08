import 'package:flutter/material.dart';

class IntroSlider extends StatefulWidget {
  // List slides
  final List<Slide> slides;

  // Skip button
  final Widget renderSkipBtn;
  final Function onSkipPress;
  final String nameSkipBtn;
  final TextStyle styleNameSkipBtn;
  final Color colorSkipBtn;
  final Color highlightColorSkipBtn;
  final bool isShowSkipBtn;
  final double borderRadiusSkipBtn;

  // Next, Done button
  final Widget renderNextBtn;
  final Widget renderDoneBtn;
  final Function onDonePress;
  final String nameNextBtn;
  final String nameDoneBtn;
  final TextStyle styleNameDoneBtn;
  final Color colorDoneBtn;
  final Color highlightColorDoneBtn;
  final double borderRadiusNextBtn;
  final double borderRadiusDoneBtn;

  // Dot indicator
  final bool isShowDotIndicator;
  final Color colorDot;
  final Color colorActiveDot;
  final double sizeDot;

  // Constructor
  IntroSlider({
    // List slides
    @required this.slides,

    // Skip button
    this.renderSkipBtn,
    this.onSkipPress,
    this.nameSkipBtn,
    this.styleNameSkipBtn,
    this.colorSkipBtn,
    this.highlightColorSkipBtn,
    this.isShowSkipBtn,
    this.borderRadiusSkipBtn,

    // Done button
    this.renderNextBtn,
    this.renderDoneBtn,
    this.onDonePress,
    this.nameNextBtn,
    this.nameDoneBtn,
    this.styleNameDoneBtn,
    this.colorDoneBtn,
    this.highlightColorDoneBtn,
    this.borderRadiusNextBtn,
    this.borderRadiusDoneBtn,

    // Dot indicator
    this.isShowDotIndicator,
    this.colorDot,
    this.colorActiveDot,
    this.sizeDot,
  });

  @override
  IntroSliderState createState() => new IntroSliderState(
    // List slides
    slides: this.slides,

    // Skip button
    renderSkipBtn: this.renderSkipBtn,
    onSkipPress: this.onSkipPress,
    nameSkipBtn: this.nameSkipBtn,
    styleNameSkipBtn: this.styleNameSkipBtn,
    colorSkipBtn: this.colorSkipBtn,
    highlightColorSkipBtn: this.highlightColorSkipBtn,
    isShowSkipBtn: this.isShowSkipBtn,
    borderRadiusSkipBtn: this.borderRadiusSkipBtn,

    // Done button
    renderNextBtn: this.renderNextBtn,
    renderDoneBtn: this.renderDoneBtn,
    onDonePress: this.onDonePress,
    nameNextBtn: this.nameNextBtn,
    nameDoneBtn: this.nameDoneBtn,
    styleNameDoneBtn: this.styleNameDoneBtn,
    colorDoneBtn: this.colorDoneBtn,
    highlightColorDoneBtn: this.highlightColorDoneBtn,
    borderRadiusNextBtn: this.borderRadiusNextBtn,
    borderRadiusDoneBtn: this.borderRadiusDoneBtn,

    // Dot indicator
    isShowDotIndicator: this.isShowDotIndicator,
    colorDot: this.colorDot,
    colorActiveDot: this.colorActiveDot,
    sizeDot: this.sizeDot,
  );
}

class IntroSliderState extends State<IntroSlider> with SingleTickerProviderStateMixin {
  // List slides
  final List<Slide> slides;

  // Skip button
  Widget renderSkipBtn;
  Function onSkipPress;
  String nameSkipBtn;
  TextStyle styleNameSkipBtn;
  Color colorSkipBtn;
  Color highlightColorSkipBtn;
  bool isShowSkipBtn;
  double borderRadiusSkipBtn;

  // Done button
  Widget renderNextBtn;
  Widget renderDoneBtn;
  Function onDonePress;
  String nameNextBtn;
  String nameDoneBtn;
  TextStyle styleNameDoneBtn;
  Color colorDoneBtn;
  Color highlightColorDoneBtn;
  double borderRadiusNextBtn;
  double borderRadiusDoneBtn;

  // Dot indicator
  bool isShowDotIndicator = true;
  Color colorDot;
  Color colorActiveDot;
  double sizeDot = 8.0;

  // Constructor
  IntroSliderState({
    // List slides
    @required this.slides,

    // Skip button
    @required this.renderSkipBtn,
    @required this.onSkipPress,
    @required this.nameSkipBtn,
    @required this.styleNameSkipBtn,
    @required this.colorSkipBtn,
    @required this.highlightColorSkipBtn,
    @required this.isShowSkipBtn,
    @required this.borderRadiusSkipBtn,

    // Done button
    @required this.renderNextBtn,
    @required this.renderDoneBtn,
    @required this.onDonePress,
    @required this.nameNextBtn,
    @required this.nameDoneBtn,
    @required this.styleNameDoneBtn,
    @required this.colorDoneBtn,
    @required this.highlightColorDoneBtn,
    @required this.borderRadiusNextBtn,
    @required this.borderRadiusDoneBtn,

    // Dot indicator
    @required this.isShowDotIndicator,
    @required this.colorDot,
    @required this.colorActiveDot,
    @required this.sizeDot,
  });

  TabController tabController;

  List<Widget> tabs = new List();
  List<Widget> dots = new List();

  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: slides.length, vsync: this);
    tabController.addListener(() {
      // To change dot color
      this.setState(() {});
    });

    // Skip button
    if (onSkipPress == null) {
      onSkipPress = () {};
    }
    if (isShowSkipBtn == null) {
      isShowSkipBtn = true;
    }

    // Done button
    if (onDonePress == null) {
      onDonePress = () {};
    }

    // Dot indicator
    if (isShowDotIndicator == null) {
      isShowDotIndicator = true;
    }
    if (colorDot == null) {
      colorDot = Color(0x80000000);
    }
    if (colorActiveDot == null) {
      colorActiveDot = Color(0xffffffff);
    }
    if (sizeDot == null) {
      sizeDot = 8.0;
    }

    renderListTabs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: slides.length,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: tabs,
                controller: tabController,
              ),
              renderBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderBottom() {
    return Positioned(
      child: Row(
        children: <Widget>[
          // Skip button
          (tabController.index + 1 != slides.length && isShowSkipBtn)
              ? Container(
            child: renderSkipBtn != null
                ? FlatButton(
              child: renderSkipBtn,
              onPressed: onSkipPress,
              color: colorSkipBtn != null ? colorSkipBtn : Colors.transparent,
              highlightColor:
              highlightColorSkipBtn != null ? highlightColorSkipBtn : Colors.white.withOpacity(0.3),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(borderRadiusSkipBtn ?? 30.0)),
            )
                : FlatButton(
              onPressed: onSkipPress,
              child: Text(
                nameSkipBtn ?? "SKIP",
                style: styleNameSkipBtn ?? TextStyle(color: Colors.white),
              ),
              color: colorSkipBtn != null ? colorSkipBtn : Colors.transparent,
              highlightColor:
              highlightColorSkipBtn != null ? highlightColorSkipBtn : Colors.white.withOpacity(0.3),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(borderRadiusSkipBtn ?? 30.0)),
            ),
            width: 70.0,
            height: 70.0,
          )
              : Container(
            width: 80.0,
            height: 70.0,
          ),

          // Dot indicator
          Flexible(
            child: isShowDotIndicator
                ? Row(
              children: renderListDots(),
              mainAxisAlignment: MainAxisAlignment.center,
            )
                : Container(),
          ),

          // Next, Done button
          Container(
            child: tabController.index + 1 == slides.length
                ? (renderDoneBtn != null
                ? FlatButton(
              child: renderDoneBtn,
              onPressed: onDonePress,
              color: colorDoneBtn != null ? colorDoneBtn : Colors.transparent,
              highlightColor:
              highlightColorDoneBtn != null ? highlightColorDoneBtn : Colors.white.withOpacity(0.3),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(borderRadiusDoneBtn ?? 30.0)),
            )
                : FlatButton(
              onPressed: onDonePress,
              child: Text(
                nameDoneBtn ?? "DONE",
                style: styleNameDoneBtn ?? TextStyle(color: Colors.white),
              ),
              color: colorDoneBtn != null ? colorDoneBtn : Colors.transparent,
              highlightColor:
              highlightColorDoneBtn != null ? highlightColorDoneBtn : Colors.white.withOpacity(0.3),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(borderRadiusDoneBtn ?? 30.0)),
            ))
                : (renderNextBtn != null
                ? FlatButton(
              onPressed: () {
                tabController.animateTo(tabController.index + 1);
              },
              child: renderNextBtn,
              color: colorDoneBtn != null ? colorDoneBtn : Colors.transparent,
              highlightColor:
              highlightColorDoneBtn != null ? highlightColorDoneBtn : Colors.white.withOpacity(0.3),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(borderRadiusNextBtn ?? 30.0)),
            )
                : FlatButton(
              onPressed: () {
                tabController.animateTo(tabController.index + 1);
              },
              child: Text(
                nameNextBtn ?? "NEXT",
                style: styleNameDoneBtn ?? TextStyle(color: Colors.white),
              ),
              color: colorDoneBtn != null ? colorDoneBtn : Colors.transparent,
              highlightColor:
              highlightColorDoneBtn != null ? highlightColorDoneBtn : Colors.white.withOpacity(0.3),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(borderRadiusNextBtn ?? 30.0)),
            )),
            width: 80.0,
            height: 70.0,
          ),
        ],
      ),
      bottom: 10.0,
      left: 10.0,
      right: 10.0,
      height: 50.0,
    );
  }

  List<Widget> renderListTabs() {
    for (int i = 0; i < slides.length; i++) {
      tabs.add(
        renderTab(
          slides[i].title,
          slides[i].styleTitle,
          slides[i].marginTitle,
          slides[i].description,
          slides[i].maxLineTextDescription,
          slides[i].styleDescription,
          slides[i].marginDescription,
          slides[i].pathImage,
          slides[i].widthImage,
          slides[i].heightImage,
          slides[i].onImagePress,
          slides[i].backgroundColor,
          slides[i].colorBegin,
          slides[i].colorEnd,
          slides[i].directionColorBegin,
          slides[i].directionColorEnd,
        ),
      );
    }
    return tabs;
  }

  Widget renderTab(
      // Title
      dynamic title,
      TextStyle styleTitle,
      EdgeInsets marginTitle,

      // Description
      String description,
      int maxLineTextDescription,
      TextStyle styleDescription,
      EdgeInsets marginDescription,

      // Image
      String pathImage,
      double widthImage,
      double heightImage,
      Function onImagePress,

      // Background color
      Color backgroundColor,
      Color colorBegin,
      Color colorEnd,
      AlignmentGeometry directionColorBegin,
      AlignmentGeometry directionColorEnd,
      ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundColor != null ? [backgroundColor, backgroundColor] : [colorBegin, colorEnd],
          begin: directionColorBegin ?? Alignment.topLeft,
          end: directionColorEnd ?? Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            // Title
            child: title is String ? Text(
              title ?? "",
              style: styleTitle ??
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ) : title,
            margin: marginTitle ?? EdgeInsets.only(top: 70.0, bottom: 50.0),
          ),

          // Image
          GestureDetector(
            child: Image.asset(
              pathImage ?? "",
              width: widthImage ?? 250.0,
              height: heightImage ?? 250.0,
              fit: BoxFit.contain,
            ),
            onTap: onImagePress,
          ),

          // Description
          Container(
            child: Text(
              description ?? "",
              style: styleDescription ?? TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              maxLines: maxLineTextDescription != null ? maxLineTextDescription : 100,
              overflow: TextOverflow.ellipsis,
            ),
            margin: marginDescription ?? EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
          ),
        ],
      ),
    );
  }

  List<Widget> renderListDots() {
    dots.clear();
    for (int i = 0; i < slides.length; i++) {
      Color currentColor;
      if (tabController.index == i) {
        currentColor = colorActiveDot;
      } else {
        currentColor = colorDot;
      }
      dots.add(renderDot(sizeDot, currentColor));
    }
    return dots;
  }

  Widget renderDot(double radius, Color color) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius / 2)),
      width: radius,
      height: radius,
      margin: EdgeInsets.all(radius / 2),
    );
  }
}

class Slide {
  // Title
  dynamic title;
  TextStyle styleTitle;
  EdgeInsets marginTitle;

  // Image
  String pathImage;
  double widthImage;
  double heightImage;
  Function onImagePress;

  // Description
  String description;
  int maxLineTextDescription;
  TextStyle styleDescription;
  EdgeInsets marginDescription;

  // Background color
  Color backgroundColor;
  Color colorBegin;
  Color colorEnd;
  AlignmentGeometry directionColorBegin;
  AlignmentGeometry directionColorEnd;

  // Skip button
  String nameSkipBtn;
  TextStyle styleNameSkipBtn;
  Color colorSkipBtn;
  Color highlightColorSkipBtn;

  // Done button
  String nameDoneBtn;
  TextStyle styleNameDoneBtn;
  Color colorDoneBtn;
  Color highlightColorDoneBtn;

  Slide({
    // Title
    dynamic title,
    TextStyle styleTitle,
    EdgeInsets marginTitle,

    // Image
    String pathImage,
    double widthImage,
    double heightImage,
    Function onImagePress,

    // Description
    String description,
    int maxLineTextDescription,
    TextStyle styleDescription,
    EdgeInsets marginDescription,

    // Background color
    Color backgroundColor,
    Color colorBegin,
    Color colorEnd,
    AlignmentGeometry directionColorBegin,
    AlignmentGeometry directionColorEnd,
  }) {
    // Title
    this.title = title;
    this.styleTitle = styleTitle;
    this.marginTitle = marginTitle;

    // Image
    this.pathImage = pathImage;
    this.widthImage = widthImage;
    this.heightImage = heightImage;
    this.onImagePress = onImagePress;

    // Description
    this.description = description;
    this.maxLineTextDescription = maxLineTextDescription;
    this.styleDescription = styleDescription;
    this.marginDescription = marginDescription;

    // Background color
    this.backgroundColor = backgroundColor;
    this.colorBegin = colorBegin;
    this.colorEnd = colorEnd;
    this.directionColorBegin = directionColorBegin;
    this.directionColorEnd = directionColorEnd;

    // Skip button
    this.nameSkipBtn = nameSkipBtn;
    this.styleNameSkipBtn = styleNameSkipBtn;
    this.colorSkipBtn = colorSkipBtn;
    this.highlightColorSkipBtn = highlightColorSkipBtn;

    // Done button
    this.nameDoneBtn = nameDoneBtn;
    this.styleNameDoneBtn = styleNameDoneBtn;
    this.colorDoneBtn = colorDoneBtn;
    this.highlightColorDoneBtn = highlightColorDoneBtn;
  }
}