import 'package:flutter/material.dart';
import 'package:shamo_app/config/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Profile Page',
          style: primaryTextStyle,
        ),
      ),
    );
  }
}
