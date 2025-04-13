import 'widget/imageandtext.dart';
import 'widget/logoandtext.dart';
import 'widget/textandbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30.0.h,
                bottom: 30.h,
              ),
              child: Column(
                children: [
                  // logo and text
                  const Logoandtext(),

                  SizedBox(height: 30.h),
                  const Imageandtext(),

                  const Textandbutton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
