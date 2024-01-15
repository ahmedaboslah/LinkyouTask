
import 'package:flutter/material.dart';

import 'Loginbutton.dart';

class LoginViewbody extends StatelessWidget {
  const LoginViewbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: LoginButton(),
        ),
      ],
    );
  }
}
