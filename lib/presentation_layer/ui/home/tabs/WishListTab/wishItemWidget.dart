import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/Product.dart';
import 'package:ecommerce/presentation_layer/ui/home/addToCart/addToCartViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/WishListTab/WishListViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/WishListTab/addToWishListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WishItemWidget extends StatefulWidget {
  Product product;

  WishItemWidget({required this.product});

  @override
  State<WishItemWidget> createState() => _WishItemWidgetState();
}

class _WishItemWidgetState extends State<WishItemWidget> {
  AddToWishListViewModel viewModel = getIt<AddToWishListViewModel>();
  WishListViewModel wishListViewModel = getIt<WishListViewModel>();
  AddToCartViewModel addToCartViewModel = getIt<AddToCartViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Color.fromRGBO(0, 65, 130, 0.3))),
      width: 350.w,
      height: 113.h,
      child: Row(
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imagePrvider) => Container(
              width: 120.w,
              height: 113.h,
              decoration:
                  BoxDecoration(image: DecorationImage(image: imagePrvider)),
            ),
            imageUrl: widget.product.imageCover ?? "No Image",
            //fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 160.w,
                    child: Text(
                      widget.product.title ?? "No Title",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color.fromRGBO(6, 0, 79, 1), fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  BlocConsumer(
                    bloc: wishListViewModel,
                    builder: (BuildContext context, state) {
                      if (state is WishListLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(6, 0, 79, 1),
                          ),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          wishListViewModel
                              .deleteProductUserCase(widget.product.id!);
                        },
                        child: Image.asset(
                          "assests/images/img_6.png",
                          width: 50.w,
                          height: 40.h,
                        ),
                      );
                    },
                    listener: (BuildContext context, Object? state) {
                      if (state is WishListErrorState) {
                        print(state.errorMessage);
                        Fluttertoast.showToast(
                            msg: state.errorMessage,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20.0);
                      }
                      if (state is WishListSuccessState) {
                        Fluttertoast.showToast(
                            msg: state.productEntity.message ?? "No message",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.white,
                            textColor: Colors.green,
                            fontSize: 20.0);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  const Text("EGP ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  Text(widget.product.priceAfterDiscount == null
                      ? widget.product.price.toString()
                      : widget.product.priceAfterDiscount.toString()),
                  SizedBox(
                    width: 15.w,
                  ),
                  Visibility(
                      visible: widget.product.priceAfterDiscount != null,
                      child: Text(widget.product.price.toString(),
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Color.fromRGBO(0, 65, 130, 0.6)))),
                  SizedBox(
                    width: 20.w,
                  ),
                  BlocConsumer(
                    bloc: addToCartViewModel,
                    builder: (BuildContext context, state) {
                      if (state is AddToCartLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(6, 0, 79, 1),
                          ),
                        );
                      }
                      return Container(
                        width: 100.w,
                        height: 30.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(0, 65, 130, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          onPressed: () {
                            addToCartViewModel.addToCart(productId: widget.product.id!);
                          },
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                    listener: (BuildContext context, Object? state) {
                      if (state is AddToCartErrorState) {
                        print(state.errorMessage);
                        Fluttertoast.showToast(
                            msg: state.errorMessage,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20.0);
                      }
                      if (state is AddToCartSuccessState) {
                        Fluttertoast.showToast(
                            msg: state.cartResponseEntity.message??"",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.white,
                            textColor: Colors.green,
                            fontSize: 20.0);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
