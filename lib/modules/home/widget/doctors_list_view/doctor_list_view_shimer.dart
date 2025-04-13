import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorListViewShimer extends StatelessWidget {
  const DoctorListViewShimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5, // Show 5 shimmer items
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Shimmer.fromColors(
                  
                  baseColor: ColorManager.lightgrey,
                  highlightColor: ColorManager.white,
                  child: Container(
                    width: 110.w,
                    height: 120.h,
                  
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.r),
                      color: ColorManager.white
                    ),
                  ),
                ),
                  
                SizedBox(width: 14.w),
                  
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorManager.lightgrey,
                        highlightColor: ColorManager.white,
                        child: Container(
                          width: 180.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: ColorManager.lightgrey,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(
                              12.r,
                            ),
                          ),
                        ),
                      ),
                  
                      SizedBox(height: 5.h),
                  
                      Shimmer.fromColors(
                        baseColor: ColorManager.lightgrey,
                        highlightColor: ColorManager.white,
                        child: Container(
                          width: 160.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: ColorManager.lightgrey,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(
                              12.r,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                  
                      Shimmer.fromColors(
                        baseColor: ColorManager.lightgrey,
                        highlightColor: ColorManager.white,
                        child: Container(
                          width: 160.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: ColorManager.lightgrey,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(
                              12.r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
