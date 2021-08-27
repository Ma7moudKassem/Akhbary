import 'package:bloc/bloc.dart';
import 'package:filkhaber/modules/about/about_screen.dart';

import 'package:filkhaber/modules/explore/explore_screen.dart';
import 'package:filkhaber/modules/home/home_screen.dart';
import 'package:filkhaber/modules/news/news_screen.dart';

import 'package:filkhaber/shared/cubit/state.dart';
import 'package:filkhaber/shared/network/remote/cache_helper.dart';
import 'package:filkhaber/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    NewsScreen(),
    SearchScreen(),
    AboutScreen(),
  ];
  List<String> titles = [
    'مختارة لك',
    'الأخبار',
    'تصفح المزيد',
    'معلومات عن المطور'

  ];
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'الرئيسية',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.art_track_sharp,
      ),
      label: 'الأخبار',
    ),
       BottomNavigationBarItem(

      icon: Icon(Icons.search),
      label: 'تصفح المزيد',
    ),
     BottomNavigationBarItem(
      icon: Icon(
        Icons.info_outline,
      ),
      label: 'معلومات عن المطور',
    ),

  ];

  void changeBottomNavItem(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  bool isDark = false;
  void changedMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(value: isDark, key: 'isDark').then((value) {
        emit(AppChangeModeState());
      });
    }
  }

  List<dynamic> general = [];
  void getGeneral() {
    emit(AppGeneralLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'general',
      'apiKey': '5923ae5a90404c5285957f24e4802c66',
    }).then((value) {
      emit(AppGetGeneralSuccessState());
      general = value.data['articles'];
      print(general[0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(AppGetGeneralErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(AppGetBusinessLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '68370916948d416688343e8ad3243d5f',
    }).then((value) {
      emit(AppGetBusinessSuccessState());
      business = value.data['articles'];
      print(business[0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(AppGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(AppGetSportsLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '8873b2b577504d4c82aeb9ce1dc50fc1',
    }).then((value) {
      emit(AppGetSportsSuccessState());
      sports = value.data['articles'];
      print(sports[0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(AppGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(AppGetScienceLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '30a008ab3da04bcba83f1298035677e7',
    }).then((value) {
      emit(AppGetScienceSuccessState());
      science = value.data['articles'];
      print(science[0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(AppGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> health = [];
  void getHealth() {
    emit(AppGetHealthLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '8873b2b577504d4c82aeb9ce1dc50fc1',
    }).then((value) {
      emit(AppGetHealthSuccessState());
      health = value.data['articles'];
      print(science[0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(AppGetHealthErrorState(error.toString()));
    });
  }

  List<dynamic> entertainment = [];
  void getEntertainment() {
    emit(AppGetEntertainmentLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '30a008ab3da04bcba83f1298035677e7',
    }).then((value) {
      emit(AppGetEntertainmentSuccessState());
      entertainment = value.data['articles'];
      print(entertainment[0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(AppGetEntertainmentErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    //search = [] ;
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '30a008ab3da04bcba83f1298035677e7',
    }).then((value) {
      // print(value.data['articles'][0]['title'].toString());

      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessfulState());
    }).catchError((error) {
      print(error.toString());

      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}






//68370916948d416688343e8ad3243d5f

// 8873b2b577504d4c82aeb9ce1dc50fc1
//30a008ab3da04bcba83f1298035677e7
