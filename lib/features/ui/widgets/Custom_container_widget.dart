import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomContainerWidget extends StatelessWidget {
  String? image ;
  String? nameProduct ;
  String? nameColor ;
  int? price ;
  CustomContainerWidget({super.key ,this.image,this.price ,this.nameProduct ,this.nameColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        width: 398.w,
        height: 113.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)
            ),
            border: Border.all(
                color: AppColors.primaryColor
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image?? AppAssets.testImage),
            // SizedBox(width:5.w,),
            Column(
              children: [
                Text(nameProduct ??"" ,style: AppStyles.semi20Primary,),
                Text( nameColor ??"color " ,style: AppStyles.regular12Text,),
                Text("EGP $price" ,style: AppStyles.semi20Primary,)
              ],
            ),
            Column(
              children: [
                Image.asset(AppAssets.isFavorite),
                Container(
                  alignment: Alignment.bottomRight,
                  width: 100.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: TextButton(onPressed: (){}, child: Text("Add To Cart ",style:AppStyles.regular12Text)),
                )
              ],
            ),



          ],

        ),
      ),
    );
  }
}
