import '../../../core/helpers/extentions.dart';
import '../../../core/routing/routes_constant.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textandbutton extends StatelessWidget {
  const Textandbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Text(
            style: TextStyles.font12GreyRegular,
            textAlign: TextAlign.center,
            'Manage and schedule all of your medical appointments\neasily with Docdoc to get a new experience.',
          ),

          SizedBox(height: 30.h),

          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              backgroundColor: ColorManager.mainBlue,
              tapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size(1.sw, 50.h),
            ),
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
            child: Text(
              'Get Started',
              style: TextStyles.font16WhiteSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
