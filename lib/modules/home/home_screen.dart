
import 'package:doctor_app/modules/home/widget/doctors_list_view/doctor_list_builder.dart';
import 'package:doctor_app/modules/home/widget/specialization/speciality_bloc_builder.dart';

import 'widget/image_container.dart';
import 'widget/doctor_speciality_see_all.dart';
import 'widget/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedSpecialityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // top bar
              const HomeTopBar(),

              SizedBox(height: 20.h),
              //doctor container
              const DoctorContainer(),
              SizedBox(height: 24.h),
              const DoctorSpecialitySeeAll(),

              SizedBox(height: 24.h),

              // doctor speciality
              const SpecialityBlocBuilder(),

              SizedBox(height: 8.h),
              // doctor list
               const DoctorListBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
