
import 'package:conditional_builder/conditional_builder.dart';
import 'package:filkhaber/shared/components/componens.dart';
import 'package:filkhaber/shared/cubit/cubit.dart';
import 'package:filkhaber/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getSports(),
      child: BlocConsumer<AppCubit , AppState>(
          builder: (context , state) {
            var list = AppCubit
                .get(context)
                .sports;
            return articleBuilder(list, context);
          },

          listener: (context , state){}
      ),
    );
  }
}

//ConditionalBuilder(
//                 condition: list.length==0,
//                 builder: (context)=>Center(child: CircularProgressIndicator()),
//                 fallback: (context)=>ListView.separated(
//                     itemBuilder: (context , index)=>buildArticleItems(list[index], context),
//                     separatorBuilder: (context , index)=>Padding(
//                       padding: const EdgeInsetsDirectional.only(
//                         start: 30,
//                       ),
//                       child: Container(
//                         height: 1,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     itemCount: list.length)
//             );