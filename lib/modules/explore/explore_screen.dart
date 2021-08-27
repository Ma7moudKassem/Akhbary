import 'package:filkhaber/shared/components/componens.dart';
import 'package:filkhaber/shared/cubit/cubit.dart';
import 'package:filkhaber/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit , AppState>(
          listener: (context , state){},
          builder: (context , state){
            var list =AppCubit.get(context).search;
            return Scaffold(
              appBar: AppBar(),
              body: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: defaultTextFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      prefix: Icons.search,
                      onChanged: (value){
                        AppCubit.get(context).getSearch(value);
                      },
                      lapelText: 'Search',

                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Search mustn\'t be empty';
                        }
                        return null;
                      },


                    ),
                  ),

                  Expanded(child: articleBuilder(list , context , isSearch: true)),
                ],
              ),
            );


          }

      ),
    );
  }
}