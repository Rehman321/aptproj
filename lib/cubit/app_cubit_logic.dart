import 'package:aptproj/cubit/app_cubit_state.dart';
import 'package:aptproj/cubit/app_cubits.dart';
import 'package:aptproj/welcomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state){
          if(state is WelcomeState){
            return Myhome();
          }if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return  Container();
          }
        },
      ),
    );
  }
}
