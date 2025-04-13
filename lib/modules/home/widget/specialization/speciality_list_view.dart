import 'package:doctor_app/modules/home/cubit/home_cubit.dart';
import 'package:doctor_app/modules/home/model/speciality_response_model.dart';
import 'package:doctor_app/modules/home/widget/specialization/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({
    super.key,
    required this.specializationDataList,
  });

  final List<Data>? specializationDataList;
  @override
  State<SpecialityListView> createState() =>
      _SpecialityListViewState();
}

class _SpecialityListViewState
    extends State<SpecialityListView> {
  int selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),

        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });

              context.read<HomeCubit>().getDoctorList(
                specializationId:
                    widget
                        .specializationDataList![index]
                        .id!,
              );
            },

            child: SpecialityListViewItem(
              index: index,
              selectedIndex: selectedSpecializationIndex,
              itemSpecializationData:
                  widget.specializationDataList![index],
            ),
          );
        },
      ),
    );
  }
}
