import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/core/cach/shared_preferences.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AutoSizeText(
                'Welcome, Moataz',
                style: AppStyles.medium18Header,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  AutoSizeText(
                    'mohamed.N@gmail.com',
                    style: AppStyles.regular14Primary,
                  ),
                   IconButton(onPressed: (){
                     //todo:remove token

                     SharedPreferencesUtils.removeData(key: "token");
                     //todo: go to login
Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginRoute, (routes)=>false);
                   }, icon: Icon(Icons.logout))
                ] 
              ),
              SizedBox(height: 48.h),
              AutoSizeText(
                'Your full name',
                style: AppStyles.medium18Header,
              ),
              AutoSizeText(
                'Mohamed Mohamed Nabil',
                style: AppStyles.regular14Primary,              ),
              SizedBox(height: 24.h),
              AutoSizeText(
                'Your E-mail',
                style: AppStyles.medium18Header,
              ),
              AutoSizeText(
                'mohamed.N@gmail.com',
                style: AppStyles.regular14Primary,              ),
              SizedBox(height: 24.h),
              AutoSizeText(
                'Your password',
                style: AppStyles.medium18Header,
              ),
              AutoSizeText(
                '********',
                style: AppStyles.regular14Primary,              ),
              SizedBox(height: 24.h),
              AutoSizeText(
                'Your mobile number',
                style: AppStyles.medium18Header              ),
              AutoSizeText(
                '0122i18855',
                style: AppStyles.regular14Primary,              ),
              SizedBox(height: 24.h),
              AutoSizeText(
                'Your Address',
                style: AppStyles.medium18Header,
              ),
              AutoSizeText(
                '6th October, street 11...',
                style:AppStyles.regular14Primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

