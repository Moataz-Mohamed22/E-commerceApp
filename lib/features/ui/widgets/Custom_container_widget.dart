import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomContainerWidget extends StatelessWidget {
  final String? image;
  final String? nameProduct;
  final String? nameColor;
  final int? price;

  CustomContainerWidget({
    super.key,
    this.image,
    this.price,
    this.nameProduct,
    this.nameColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: 398.w,
      height: 113.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            child: image?.startsWith('http') == true
                ? CachedNetworkImage(
              imageUrl: image ?? "",
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(color: AppColors.primaryDark),
              ),
              errorWidget: (context, url, error) => Image.asset(
                AppAssets.testImage,
                fit: BoxFit.cover,
              ),
            )
                : Image.asset(
              image ?? AppAssets.testImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameProduct ?? "",
                  style: AppStyles.semi20Primary,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  nameColor ?? "color",
                  style: AppStyles.regular12Text,
                ),
                Text(
                  "EGP ${price ?? 0}",
                  style: AppStyles.semi20Primary,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 80.w,
                  height: 80.h,
                  child: image?.startsWith('http') == true
                      ? CachedNetworkImage(
                    imageUrl: image ?? "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(color: AppColors.primaryDark),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      AppAssets.testImage,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Image.asset(
                    image ?? AppAssets.testImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                alignment: Alignment.bottomRight,
                width: 100.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Add To Cart",
                    style: AppStyles.regular12Text.copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

 