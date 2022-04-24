import 'package:flutter/material.dart';
import 'package:shamo_app/config/theme.dart';

class LovePage extends StatelessWidget {
  const LovePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Love Page',
          style: primaryTextStyle,
        ),
      ),
    );
  }
}
