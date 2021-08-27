
import 'package:conditional_builder/conditional_builder.dart';
import 'package:filkhaber/shared/components/componens.dart';
import 'package:filkhaber/shared/cubit/cubit.dart';
import 'package:filkhaber/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getScience(),
      child: BlocConsumer<AppCubit , AppState>(
          builder: (context , state){
            var list = AppCubit.get(context).science;
            return articleBuilder(list, context);
          },
          listener: (context , state){}
      ),
    );
  }
}
