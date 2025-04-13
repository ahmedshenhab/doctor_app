import '../../../core/helpers/extentions.dart';
import '../../../core/routing/routes_constant.dart';
import '../../../core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "don't have an account ? ",
            style: TextStyles.font13blueRegular,
          ),

          TextSpan(
            text: "Sign Up",
            style: TextStyles.font13blueSemiBold,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    
                    context.pushReplacementNamed(
                      Routes.registerScreen,
                    );
                  },
          ),
        ],
      ),
    );
  }
}
