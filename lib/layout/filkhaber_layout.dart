import 'package:bloc/bloc.dart';
import 'package:filkhaber/shared/components/componens.dart';
import 'package:filkhaber/shared/cubit/cubit.dart';
import 'package:filkhaber/shared/cubit/state.dart';
import 'package:filkhaber/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilkhaberLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context , index){},
      builder: (context , index){
        var cubit = AppCubit.get(context);
        return  Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    cubit.titles[cubit.currentIndex]
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: IconButton(
                    onPressed:(){AppCubit.get(context).changedMode();}, icon:  Icon(Icons.dark_mode_rounded,),),
                ),

              ],

            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold
              ),
              type: BottomNavigationBarType.fixed,
              items: cubit.bottomItem,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavItem(index);


              },


            ),
            body: cubit.screens[cubit.currentIndex],
        );
      },


    );
  }
}


