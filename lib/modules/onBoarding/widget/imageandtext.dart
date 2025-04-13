import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/styles.dart';

class Imageandtext extends StatelessWidget {
  const Imageandtext({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment(, 1),
      children: [
        SvgPicture.asset(
          'assets/svg/background_logo.svg',
          // width: 20,
        ),

        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withAlpha(0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(
            'assets/images/onboarding_doctor.png',
          ),
        ),

        Positioned(
          bottom: 30.h,
          right: 0,
          left: 0,

          child: Text(
            overflow: TextOverflow.ellipsis,

            textAlign: TextAlign.center,
            'Best Doctor\nAppointment App',
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
