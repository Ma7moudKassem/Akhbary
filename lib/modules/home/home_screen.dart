import 'package:conditional_builder/conditional_builder.dart';
import 'package:filkhaber/shared/components/componens.dart';
import 'package:filkhaber/shared/cubit/cubit.dart';
import 'package:filkhaber/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen  extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getGeneral(),
      child: BlocConsumer<AppCubit ,  AppState>(

          listener: (context , state){},
          builder: (context , state){
            var list = AppCubit.get(context).general;
            return ConditionalBuilder(
              condition: list.length ==0,
              builder: (context)=>Center(child: CircularProgressIndicator()),
              fallback: (context)=> ListView.separated(
                itemBuilder: (context , index)=>homeNewsItem(list[index] , context),
                separatorBuilder: (context , index)=> Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                itemCount: list.length,
              ),

            );
          },
      ),
    );
  }
}
