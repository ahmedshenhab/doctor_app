
import 'package:doctor_app/modules/home/model/speciality_response_model.dart';
import 'package:doctor_app/modules/home/widget/doctors_list_view/doctor_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, this.doctor});
  final List<Doctors>? doctor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
       
        itemCount: doctor?.length,
        shrinkWrap: true,

        itemBuilder: (context, index) {
          return DoctorListViewItem(doctor: doctor?[index]);
        },
      ),
    );
  }
}
