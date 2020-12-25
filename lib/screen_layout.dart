import 'package:flutter/material.dart';
import 'box_painter.dart';
import 'custom_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController rotationController;
  AnimationController widthController;
  Animation<double> rotationAnimation;
  Animation<double> widthAnimation;
  double borderWidth = 5;
  double rotationAmount = 0;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    rotationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    rotationAnimation = CurvedAnimation(
      parent: rotationController,
      curve: Curves.linear,
    );

    widthController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    widthAnimation =
        Tween<double>(begin: 0.0, end: 50.0).animate(widthController);
    //widthController.forward();
    widthController.addListener(() {
      if (widthController.isCompleted) {
        widthController.reverse();
      } else if (widthController.isDismissed) {
        widthController.forward();
      }
    });
  }

  // @override
  // void dispose() {
  //   rotationController.dispose();
  //   super.dispose();
  // }

  void onDownRotateCallback() {
    setState(() {
      isPlaying = true;
    });
    rotationController.repeat();
  }

  void onUpRotatecallBack() {
    setState(() {
      isPlaying = false;
    });
    rotationController.stop();
  }

  void onDownGrowCallback() {
    widthController.forward();
  }

  void onUpGrowcallBack() {
    widthController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RotationTransition(
              turns: rotationAnimation,
              child: RectCanvas(
                borderWidth: widthAnimation.value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  downCallback: () {
                    onDownRotateCallback();
                  },
                  upCallback: () {
                    onUpRotatecallBack();
                  },
                  buttonLabel: 'Rotate',
                ),
                CustomButton(
                  downCallback: () {
                    onDownGrowCallback();
                  },
                  upCallback: () {
                    onUpGrowcallBack();
                  },
                  buttonLabel: 'Grow',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
