import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/home_screen_cubit/home_screen_view_model.dart';
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
          appBar: AppBar(),
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
                    ])),
          ),
        );
      },
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
        label: "");
  }
}
