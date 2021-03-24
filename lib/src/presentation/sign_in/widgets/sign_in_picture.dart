import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInPicture extends StatelessWidget {
  const SignInPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/password.svg',
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.6,
      color: Theme.of(context).accentColor,
    );
  }
}
