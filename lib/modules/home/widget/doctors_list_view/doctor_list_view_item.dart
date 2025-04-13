import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/styles.dart';
import 'package:doctor_app/modules/home/model/speciality_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorListViewItem extends StatelessWidget {
  const DoctorListViewItem({
    super.key,
    required this.doctor,
  });
  final Doctors? doctor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),

      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg',

            progressIndicatorBuilder:
                (context, url, progress) =>
                    Shimmer.fromColors(
                      baseColor: ColorManager.lightgrey,
                      highlightColor: ColorManager.white,
                      child: Container(
                        width: 110.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              BorderRadius.circular(12.r),
                          color: ColorManager.white,
                        ),
                      ),
                    ),
            imageBuilder:
                (context, imageProvider) => Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                      12.r,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          ),

          //
          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor?.name ?? 'undefined name',
                  style: TextStyles.font16darkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),

                Text(
                  doctor!.specialization!.name ??
                      'undefined specialization',

                  style: TextStyles.font12GreyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),

                Text(
                  doctor?.email ?? 'undefined email',
                  style: TextStyles.font12GreyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
