// ignore_for_file: prefer_const_constructors

import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorContainer extends StatelessWidget {
  const DoctorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/blueContainer.png',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(24.r),
            ),

            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18WhiteMedium,
                ),

                SizedBox(height: 16.h),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.white,

                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 18.w,
                      //   vertical: 10.h,
                      // ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          48.r,
                        ),
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style:
                          TextStyles.font12bMainBlueRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            right: 16,

            child: Image.asset(
              height: 197.h,

              'assets/images/imageContainer.png',
            ),
          ),
        ],
      ),
    );
  }
}
