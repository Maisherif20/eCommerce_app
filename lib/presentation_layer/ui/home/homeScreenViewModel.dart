import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel():super(HomeTabState());
  void getTabs(int indexTab){
    if(indexTab == 0)
      {
        emit(HomeTabState());
      }
    if(indexTab==1)
      {
        emit(CategoriesTabState());
      }
    if(indexTab==2)
      {
        emit(WishListTabState());
      }
    if(indexTab == 3)
      {
        emit(ProfileTabState());
      }
    if(indexTab == 4)
    {
      emit(CartTabState());
    }


  }
}

sealed class HomeScreenState {}

class CategoriesTabState extends HomeScreenState {}

class HomeTabState extends HomeScreenState {}

class ProfileTabState extends HomeScreenState {}

class WishListTabState extends HomeScreenState {}
class CartTabState extends HomeScreenState {}
