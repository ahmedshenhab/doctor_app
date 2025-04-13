import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/modules/home/model/speciality_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({
    super.key,
    this.itemSpecializationData,
    required this.index,
    required this.selectedIndex,
  });

  final int index;
  final int selectedIndex;
  final Data? itemSpecializationData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: index == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          selectedIndex == index
              ? Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.darkBlue,
                  ),
                  shape: BoxShape.circle,
                ),

                child: CircleAvatar(
                  backgroundColor:
                      ColorManager.moreLighterGrey,
                  radius: 30.r,
                  child: SvgPicture.asset(
                    width: 42.w,
                    height: 42.h,
                    'assets/svg/doctorSpecialist.svg',
                  ),
                ),
              )
              : CircleAvatar(
                backgroundColor:
                    ColorManager.moreLighterGrey,
                radius: 30.r,
                child: SvgPicture.asset(
                  width: 40.w,
                  height: 40.h,
                  'assets/svg/doctorSpecialist.svg',
                ),
              ),
          SizedBox(height: 8.h),
          Text(
            itemSpecializationData!.name ??
                'undefined specialization',
            style:
                index == selectedIndex
                    ? TextStyles.font14darkBlueBold
                    : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
