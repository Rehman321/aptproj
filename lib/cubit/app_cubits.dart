import 'package:aptproj/cubit/app_cubit_state.dart';
import 'package:bloc/bloc.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit() : super(InitialState()){
    emit(WelcomeState());
  }

  void getData(){
    try{
      emit(LoadedState());

    }catch(e){

    }
  }

}