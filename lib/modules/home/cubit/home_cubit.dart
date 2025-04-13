import 'package:doctor_app/modules/home/model/speciality_response_model.dart';

import '../repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._homeRepo) : super(HomeInitialState());

  final HomeRepo _homeRepo;
  List<Data>? specializationList;

  Future<void> getData() async {
    emit(HomeLoadingState());

    final response = await _homeRepo.getSpecializations();
    response.fold(
      (l) {
        emit(
          HomeErrorState(error: l.message),
        );
      },
      (r) {
        specializationList = r.data ?? [];
        getDoctorList(
          specializationId: specializationList!.first.id!,
        );

        emit(
          HomeSuccessState(homeModel: specializationList),
        );
      },
    );
  }

  void getDoctorList({required int specializationId}) {
    final specializationDoctorList =
        specializationList!
            .firstWhere(
              (element) => element.id == specializationId,
            )
            .doctorsList!
            .toList();

    emit(
      HomeDoctorSpecializationsuccessState(
        doctor: specializationDoctorList,
      ),
    );
  }
}
