import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/domain/entities/Get_cart_response_entity.dart';
import 'package:ecommerce_app/features/ui/pages/cart/cubit/cart_states.dart';
import 'package:ecommerce_app/features/ui/pages/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:ecommerce_app/features/ui/pages/cart/cubit/cart_view_model.dart';
import 'package:ecommerce_app/features/ui/pages/cart/cubit/cart_states.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    super.initState();
    CartViewModel.get(context).getItemsInCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<CartViewModel, CartStates>(
        bloc: CartViewModel.get(context),
        builder: (context, state) {
          /// حالة التحميل عند جلب العناصر
          if (state is GetCartLoadingState) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          /// حالة النجاح عند جلب العناصر
          else if (state is GetCartSuccessState) {
            double totalPrice =
                state.responseEntity.data?.totalCartPrice?.toDouble() ?? 0.0;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: CartViewModel.get(context).productList.length,
                    itemBuilder: (context, index) {
                      final product =
                      CartViewModel.get(context).productList[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            /// صورة المنتج
                            CachedNetworkImage(
                              imageUrl:
                              product.product?.imageCover?.trim() ?? "",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.image_not_supported),
                            ),
                            const SizedBox(width: 12),

                            /// تفاصيل المنتج
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.product?.title ?? "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "⚫ black | size 40",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "EGP ${product.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// زر الحذف
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                CartViewModel.get(context).deleteItemsInCart(
                                  product.product?.id.toString() ?? "",
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// قسم عرض السعر الإجمالي وزر المتابعة
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: AppStyles.medium18Header,
                          ),
                          Text(
                            "EGP $totalPrice",
                            style: AppStyles.medium18Header,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          // أكشن عند الضغط على زر "Check Out"
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Check Out",
                              style: AppStyles.regular18White,
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          /// حالة التحميل أثناء الحذف
          else if (state is DeleteCartLoadingState) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          /// حالة النجاح بعد الحذف
          else if (state is DeleteCartSuccessState) {
            // يمكنك إما إعادة استدعاء getItemsInCart() تلقائيًا
            // أو إعادة بناء واجهة بنفس بيانات state.responseEntity
            // هنا مثال لعرض القائمة مرة أخرى بنفس أسلوب GetCartSuccessState
            double totalPrice =
                state.responseEntity.data?.totalCartPrice?.toDouble() ?? 0.0;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: CartViewModel.get(context).productList.length,
                    itemBuilder: (context, index) {
                      final product =
                      CartViewModel.get(context).productList[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                              product.product?.imageCover?.trim() ?? "",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.image_not_supported),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.product?.title ?? "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "⚫ black | size 40",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "EGP ${product.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                CartViewModel.get(context).deleteItemsInCart(
                                  product.product?.id.toString() ?? "",
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price",
                            style: AppStyles.medium18Header,
                          ),
                          Text(
                            "EGP $totalPrice",
                            style: AppStyles.medium18Header,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Check Out",
                              style: AppStyles.regular18White,
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          else if (state is GetCartErrorState || state is DeleteCartErrorState) {
            return Center(
              child: Text("error"),
            );
          }

          else {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
        },
      ),
    );
  }
}



