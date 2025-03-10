import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/features/ui/widgets/Custom_container_widget.dart';
import 'package:flutter/material.dart';
class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomContainerWidget(
        image: AppAssets.testImage,
        price: 1500,
        nameColor: "black",
        nameProduct: "Moataz",
      ),
    );
  }
}
