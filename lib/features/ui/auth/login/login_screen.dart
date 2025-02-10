import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
        ),
        body : SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Image.asset(AppAssets.routeImage),
                  SizedBox(height: 75.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back To Route",style: AppStyles.semi24White,),
                      Text("Please sign in with your mail",style: AppStyles.light16White,),
                      SizedBox(height: 35.h,),
                      Text("User Name",style: AppStyles.medium18White,),
                      SizedBox(height: 20.h,),
                      CustomTextFormField(
                          hintText: "enter your name"
                      ),
                      SizedBox(height: 35.h,),
                      Text("Password",style: AppStyles.medium18White,),
                      SizedBox(height: 20.h,),
                      CustomTextFormField(
                        suffixIcon: Image.asset(AppAssets.hidePassIcon),
                          hintText: "enter your password"
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                        Text("Forget Password",style: AppStyles.regular18White,)
                      ],),
                      SizedBox(height: 35.h,),
                      CustomElevatedButton(
                          text: "Log in",
                          onTap: (){}),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(AppRoutes.registerRoute);
                        },
                        child: RichText(text: TextSpan(
                          children:[
                            TextSpan(text: "Don't Have an Account?",style: AppStyles.medium18White),
                            TextSpan(text: "Create Account",style: AppStyles.medium18White)
                          ]
                        )),
                      )
                    ],
                  ),
                ],
              ),
            )
        ));;
  }
}
