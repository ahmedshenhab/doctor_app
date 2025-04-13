

import '../model/speciality_response_model.dart';

sealed class HomeStates {
  // double area();
}
class HomeInitialState extends HomeStates {}
class HomeLoadingState
    extends HomeStates {}

class HomeSuccessState
    extends HomeStates {

      final List<Data>?  homeModel;

  HomeSuccessState({ required this.homeModel});
    }

class HomeErrorState
    extends HomeStates {

final String? error;

  HomeErrorState({ this.error});


    }
    
    
    
  class  HomeDoctorSpecializationsuccessState extends HomeStates{
 final List<Doctors>? doctor;

  HomeDoctorSpecializationsuccessState({required this.doctor});

  }

  


    
