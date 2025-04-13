import '../theming/styles.dart';
import 'package:flutter/material.dart';

class DefualtTermsAndCondition extends StatelessWidget {
  const DefualtTermsAndCondition({super.key, required this.text1});

  final String  text1;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(height: 1.5),
        children: [
          TextSpan(
            text: '$text1 you agree to our ',
            style: TextStyles.font13greyRegular,
          ),

          TextSpan(
            text: 'terms & conditions ',
            style: TextStyles.font13darkBlueRegular,
          ),
          TextSpan(
            text: 'and ',
            style: TextStyles.font13greyRegular,
          ),
          TextSpan(
            text: 'privacyPolicy',
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
