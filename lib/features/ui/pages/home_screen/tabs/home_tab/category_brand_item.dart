import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CategoryBrandItem extends StatefulWidget {
  CategoryOrBrandEntity item;

  CategoryBrandItem({required this.item});
  @override
  State<CategoryBrandItem> createState() => _CategoryBrandItemState();
}


class _CategoryBrandItemState extends State<CategoryBrandItem> {
  @override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 50.r,
                );
              },
              placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.redColor,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: AppColors.redColor,
                  ),
              width: double.infinity,
              height: 100.h,
              fit: BoxFit.cover,
              imageUrl: widget.item.image ?? ""),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 1,
            child: Text(
              widget.item.name ?? "",
              textWidthBasis: TextWidthBasis.longestLine,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
            ))
      ],
    );
  }
}
