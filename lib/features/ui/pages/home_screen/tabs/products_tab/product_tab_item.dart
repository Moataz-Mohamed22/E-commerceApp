import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/flutter_toast.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_states.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_view_model.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/product_states.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabItem extends StatelessWidget {
  final ProductEntity product;

  ProductTabItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary300Opacity, width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 190.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? "",
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: AppColors.redColor,
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: BlocBuilder<FavoriteViewModel, FavoriteStates>(
                  builder: (context, state) {
                    bool isFavorite = state is FavoriteUpDateState &&
                        state.favoriteProducts.contains(product);
                    return CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      radius: 20.r,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            final cubit = context.read<FavoriteViewModel>();
                            if (isFavorite) {
                              cubit.removeFromFavorite(product.id ?? "");
                               ToastMessage.toastMsg("Removed from favorites", AppColors.greenColor, AppColors.whiteColor);

                            } else {
                              cubit.addToFavorite(product);
                              ToastMessage.toastMsg("Added to favorites", AppColors.primaryColor, AppColors.whiteColor);
                            }
                          },
                          color: AppColors.primaryColor,
                          padding: EdgeInsets.zero,
                          iconSize: 30.r,
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                            color: AppColors.primaryColor,

                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTxt(
                  text: product.title ?? "",
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    CustomTxt(text: "EGP ${product.price}"),
                    SizedBox(width: 8.h),
                    CustomTxt(
                      text: "EGP ${product.price! * 1.5}",
                      textStyle: AppStyles.regular12SalePrice.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    CustomTxt(text: "Review (${product.ratingsAverage})"),
                    Icon(
                      Icons.star,
                      color: AppColors.orangeColor,
                      size: 25.sp,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        // Add to cart
                        ProductTabViewModel.get(context)
                            .addToCart(product.id ?? "");
                      },
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


