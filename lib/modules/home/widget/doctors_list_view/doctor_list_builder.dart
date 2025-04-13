import 'package:doctor_app/modules/home/cubit/home_cubit.dart';
import 'package:doctor_app/modules/home/cubit/home_state.dart';
import 'package:doctor_app/modules/home/widget/doctors_list_view/doctor_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorListBuilder extends StatelessWidget {
  const DoctorListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen:
          (previous, current) =>
              current
                  is HomeDoctorSpecializationsuccessState,
      builder: (context, state) {
        switch (state) {
          case HomeDoctorSpecializationsuccessState():
            return DoctorListView(doctor: state.doctor);

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
