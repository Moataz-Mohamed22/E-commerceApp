import 'package:ecommerce_app/features/ui/pages/home_screen/home_screen_cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs/favorite_tab/favorite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/products_tab/products_tab.dart';
import '../tabs/user_tab/user_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  int selectedIndex = 0;
  List<Widget> bodyList = [
    HomeTab(),
    ProductsTab(),
    FavoriteTab(),
    UserTab(),
  ];

  void bottomNavOnTab(int index) {
    selectedIndex = index;
    emit(HomeScreenChangeIndexState());
  }
}
