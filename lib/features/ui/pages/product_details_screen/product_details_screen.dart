import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productCounter = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductDetails", style: AppStyles.semi20Primary,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 25,
                color: AppColors.primaryColor,)),
          IconButton(onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color: AppColors.primaryColor,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 16.w),
          child: Column(
            children: [
              ImageSlideshow(
                  initialPage: 0,
                  indicatorColor: AppColors.primaryColor,
                  indicatorBottomPadding: 15.h,
                  indicatorPadding: 8.w,
                  indicatorRadius: 5,
                  indicatorBackgroundColor: AppColors.whiteColor,
                  isLoop: true,
                  autoPlayInterval: 3000,
                  height: 190.h,

                  children: args.images!.map((url) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: 120.h,
                        fit: BoxFit.cover,
                        imageUrl: url,
                        placeholder: (context, url) =>
                            Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryDark,),
                            ),
                        errorWidget: (context, url, error) =>
                            Icon(
                              Icons.error,
                              color: AppColors.redColor,
                            ),
                      ),
                    );
                  }).toList()),
              SizedBox(height: 24.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(
                    args.title ?? " ",
                    style: AppStyles.medium18Header,
                  )),
                  Text(
                    "EGP ${args.price}",
                    style: AppStyles.medium18Header,
                  ),
                ],
              ),
              SizedBox(height: 16.h,),
              Row(children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.w, vertical: 25.h),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: AppColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Text("${args.quantity} sold",
                    style: AppStyles.medium14Category,
                    overflow: TextOverflow.ellipsis,),
                ),
                SizedBox(width: 16.w,),
                Image.asset(AppAssets.starIcon, width: 20.w,),
                SizedBox(width: 4.w,),
                Expanded(child: Text(
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.regular14Text,
                    "${args.ratingsAverage} (${args.ratingsQuantity})"
                )),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.w, vertical: 24.h),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(24.r)
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          productCounter--;
                          setState(() {});
                        },
                        child: Icon(Icons.remove_circle_outline,
                          size: 20.w,
                          color: AppColors.whiteColor,),
                      ),
                      SizedBox(width: 18.w,),
                      AutoSizeText(
                        "$productCounter", style: AppStyles.medium18White,),
                      SizedBox(width: 18.w,),
                      InkWell(
                        onTap: () {
                          productCounter++;
                          setState(() {});
                        },
                        child: Icon(Icons.add_circle_outline,
                          size: 20.w,
                          color: AppColors.whiteColor,),
                      ),
                    ],
                  ),
                ),

              ],),
              SizedBox(height: 16.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description", style: AppStyles.medium18Header,),
                  SizedBox(height: 8.h),
                  ReadMoreText("${args.description}",
                    style: AppStyles.light18HintText,
                    trimExpandedText: "Read Less",
                    trimCollapsedText: "Read More",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    colorClickableText: AppColors.primaryColor,
                  ),
                  SizedBox(height: 150.h,),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Total Price",
                            style: AppStyles.medium18Header.copyWith(
                                color: AppColors.blackColor, fontSize: 16
                            ),),
                          SizedBox(height: 12.h,),
                          Text("EGP ${args.price}",
                            style: AppStyles.medium18Header.copyWith(
                                color: AppColors.primaryColor
                            ),)
                        ],
                      ),
                      SizedBox(width: 33.w,),
                      Expanded(child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.r),
                            ),
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 14.h),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart,
                                color: AppColors.whiteColor,),
                              SizedBox(width: 15.w,),
                              AutoSizeText("Add To Cart ",
                                style: AppStyles.medium18White,),
                              SizedBox(width: 27.w,)
                            ],
                          )))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
