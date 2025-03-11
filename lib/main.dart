import 'package:ecommerce_app/core/cach/shared_preferences.dart';
import 'package:ecommerce_app/core/utils/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/features/ui/auth/login/login_screen.dart';
import 'package:ecommerce_app/features/ui/auth/register/register_screen.dart';
import 'package:ecommerce_app/features/ui/pages/cart/cart_screen.dart';
import 'package:ecommerce_app/features/ui/pages/cart/cubit/cart_view_model.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/home_screen.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_view_model.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:ecommerce_app/features/ui/pages/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
 await SharedPreferencesUtils.init();
 String routeName ;
 var token = SharedPreferencesUtils.getData(key: "token");
 if(token == null){
   routeName = AppRoutes.loginRoute ;
 }else {
   routeName = AppRoutes.homeRoute ;
 }
  runApp(MultiBlocProvider( providers: [
    BlocProvider(create: (context) =>getIt<ProductTabViewModel>()),
    BlocProvider(create: (context) => FavoriteViewModel()),
    BlocProvider(create: (context) =>getIt<CartViewModel>()),
  ],child: MyApp(routeName: routeName,)) );
}

class MyApp extends StatelessWidget {
String routeName ;
MyApp({required this.routeName});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routes: {
            AppRoutes.registerRoute : (context) => RegisterScreen(),
            AppRoutes.loginRoute : (context) => LoginScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.productDetailsRoute: (context) => ProductDetailsScreen(),
            AppRoutes.cartRoute: (context) => CartScreen(),
            AppRoutes.favoriteRoute: (context) => FavoriteTab(),
          },
          initialRoute:
          routeName,
        );
      },
    );
  }
}
