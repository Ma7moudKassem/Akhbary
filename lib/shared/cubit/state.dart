abstract class AppState {}

class AppInitialState extends AppState{}

class AppBottomNavState extends AppState{}


class AppGetNewsSuccessState extends AppState{}

class AppGetNewsErrorState extends AppState{
  final String error;
  AppGetNewsErrorState(this.error);
}

class AppNewsLoadingState extends AppState{}


class AppGetGeneralSuccessState extends AppState{}

class AppGetGeneralErrorState extends AppState{
  final String error;
  AppGetGeneralErrorState(this.error);
}

class AppGeneralLoadingState extends AppState{}

class AppGetTrendingSuccessState extends AppState{}

class AppGetTrendingErrorState extends AppState{
  final String error;
  AppGetTrendingErrorState(this.error);
}
class AppTrendingLoadingState extends AppState{}


class AppGetExploreSuccessState extends AppState{}
class AppGetExploreErrorState extends AppState{
  final String error;
  AppGetExploreErrorState(this.error);
}
class AppExploreLoadingState extends AppState{}

class AppChangeModeState extends AppState{}

class AppGetBusinessSuccessState extends AppState{}

class AppGetBusinessLoadingState extends AppState{}

class AppGetBusinessErrorState extends AppState{
  final String error;
  AppGetBusinessErrorState(this.error);
}


class AppGetSportsSuccessState extends AppState{}

class AppGetSportsLoadingState extends AppState{}

class AppGetSportsErrorState extends AppState{
  final String error;

  AppGetSportsErrorState(this.error);}



  class AppGetScienceSuccessState extends AppState{}

  class AppGetScienceLoadingState extends AppState{}

  class AppGetScienceErrorState extends AppState{
  final String error;

  AppGetScienceErrorState(this.error);

}


class AppGetHealthSuccessState extends AppState{}

class AppGetHealthLoadingState extends AppState{}

class AppGetHealthErrorState extends AppState{
  final String error;

  AppGetHealthErrorState(this.error);
  }



class AppGetEntertainmentSuccessState extends AppState{}

class AppGetEntertainmentLoadingState extends AppState{}

class AppGetEntertainmentErrorState extends AppState {
  final String error;

  AppGetEntertainmentErrorState(this.error);
}


class NewsSearchLoadingState extends AppState{}

class NewsGetSearchSuccessfulState extends AppState{}

class NewsGetSearchErrorState extends AppState{

  final String error;

  NewsGetSearchErrorState(this.error);

}

class AppGetHomeRefreshState extends AppState{}
