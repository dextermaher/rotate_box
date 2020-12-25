import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function downCallback;
  final Function upCallback;
  final String buttonLabel;

  CustomButton({
    this.downCallback,
    this.upCallback,
    this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (changedValue) {
        downCallback();
      },
      onTapUp: (changedValue) {
        upCallback();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.red,
        child: Text(
          buttonLabel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
