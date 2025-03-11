import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_view_model.dart';
import 'package:ecommerce_app/features/ui/widgets/Custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_styles.dart';
import 'cubit/favorite_states.dart';
class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavoriteViewModel, FavoriteStates>(
        builder: (context, state) {
          if (state is FavoriteUpDateState && state.favoriteProducts.isNotEmpty) {
            return ListView.builder(
              itemCount: state.favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = state.favoriteProducts[index];
                return CustomContainerWidget(
                  image: product.imageCover ?? AppAssets.testImage,
                  price: product.price!.toInt(),
                  nameColor: "black",
                  nameProduct: product.title ?? "Product",
                );

              },
            );
          } else {
            return Center(
              child: Text(
                "No favorite products yet!",
                style: AppStyles.semi20Primary,
              ),
            );
          }
        },
      ),
    );
  }
}
