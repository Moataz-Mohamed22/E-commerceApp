import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/home_screen_cubit/home_screen_view_model.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(viewModel.selectedIndex, context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: viewModel.bodyList[viewModel.selectedIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: viewModel.selectedIndex,
                onTap: viewModel.bottomNavOnTab,
                iconSize: 24.sp,
                items: [
                  bottomNavigationBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 0,
                    selectedIcon: AppAssets.homeIconSelected,
                    unSelectedIcon: AppAssets.homeIconUnSelected,
                  ),
                  bottomNavigationBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 1,
                    selectedIcon: AppAssets.categoriesIconSelected,
                    unSelectedIcon: AppAssets.categoriesIconUnSelected,
                  ),
                  bottomNavigationBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 2,
                    selectedIcon: AppAssets.favoriteIconSelected,
                    unSelectedIcon: AppAssets.favoriteIconUnSelected,
                  ),
                  bottomNavigationBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 3,
                    selectedIcon: AppAssets.profileIconSelected,
                    unSelectedIcon: AppAssets.profileIconUnSelected,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(int selectedIndex, BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      leading: Image.asset(AppAssets.logo),
      title: Row(
        children: [
          Icon(Icons.search, color: AppColors.primaryColor),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "What do you search for?",
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.cartRoute);
          }, icon: Image.asset(AppAssets.shoppingIcon))
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItemBuilder({
    required bool isSelected,
    required String selectedIcon,
    required String unSelectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor:
        isSelected ? AppColors.primaryColor : AppColors.whiteColor,
        backgroundColor:
        isSelected ? AppColors.whiteColor : AppColors.transparent,
        radius: 25.r,
        child: Image.asset(isSelected ? selectedIcon : unSelectedIcon),
      ),
      label: "",
    );
  }
}

