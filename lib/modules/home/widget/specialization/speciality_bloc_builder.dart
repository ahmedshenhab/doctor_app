import 'package:doctor_app/modules/home/cubit/home_cubit.dart';
import 'package:doctor_app/modules/home/cubit/home_state.dart';
import 'package:doctor_app/modules/home/widget/doctors_list_view/doctor_list_view_shimer.dart';
import 'package:doctor_app/modules/home/widget/specialization/speciality_list_view.dart';
import 'package:doctor_app/modules/home/widget/specialization/specialization_list_shimer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityBlocBuilder extends StatelessWidget {
  const SpecialityBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen:
          (previous, current) =>
              current is HomeLoadingState ||
              current is HomeSuccessState ||
              current is HomeErrorState,
      builder: (context, state) {
        switch (state) {
          case HomeLoadingState():
            return  Expanded(
              child: Column(
                children: [
                  const SpecializationListShimer(),
                  SizedBox( height: 8.h,),
                  const DoctorListViewShimer()
                ],
              ),
              
            );

          case HomeSuccessState():
            return SpecialityListView(
              specializationDataList: state.homeModel ?? [],
            );

          case HomeErrorState():
            return const SizedBox.shrink();

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
