import '../../../core/helpers/extentions.dart';
import '../../../core/routing/routes_constant.dart';
import '../../../core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "do you have an account ? ",
            style: TextStyles.font13blueRegular,
          ),

          TextSpan(
            text: "Log In",
            style: TextStyles.font13blueSemiBold,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacementNamed(
                      Routes.loginScreen,
                    );
                  },
          ),
        ],
      ),
    );
  }
}
