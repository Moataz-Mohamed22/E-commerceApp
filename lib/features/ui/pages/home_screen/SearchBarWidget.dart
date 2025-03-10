import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.logo),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'What do you search for?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  filled: true,
                  fillColor: AppColors.transparent,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: AppColors.primaryColor),
                    onPressed: () {
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}