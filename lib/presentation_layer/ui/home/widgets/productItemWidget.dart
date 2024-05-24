import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/domain_layer/Use%20case/addToWishListUseCase.dart';
import 'package:ecommerce/presentation_layer/ui/home/addToCart/addToCartViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProductScreen/productDetails.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/WishListTab/addToWishListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../domain_layer/Entities/productResponse/Product.dart';

class ProductItemWidget extends StatefulWidget {
  Product product;
  String id;

  ProductItemWidget({required this.product, required this.id});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  bool isDiscount = false;
  AddToWishListViewModel addToWishListViewModel =
      getIt<AddToWishListViewModel>();
  AddToCartViewModel addToCartViewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => addToWishListViewModel),
        BlocProvider(create: (_) => addToCartViewModel),
      ],
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsScreen(product: widget.product)));
          },
          child: Stack(
            alignment: const Alignment(0.8, -0.8),
            children: [
              Container(
                height: 270.h,
                width: 191.w,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color.fromRGBO(0, 65, 130, 0.3))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        imageBuilder: (context, imagePrvider) => Container(
                          width: 191.w,
                          height: 130.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: imagePrvider)),
                        ),
                        imageUrl: widget.product.imageCover!,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Text(
                      widget.product.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                        constraints: BoxConstraints(
                          maxWidth: 191.w,
                        ),
                        child: Text(
                          widget.product.description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                    Row(
                      children: [
                        const Text("EGP "),
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
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Review ${widget.product.ratingsAverage.toString()}",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Spacer(),
                          BlocConsumer(
                            bloc: addToCartViewModel,
                            builder: (BuildContext context, state) {
                              if (state is AddToCartLoadingState) {
                                return  Center(
                                  child: CircularProgressIndicator(
                                    color: Color.fromRGBO(0, 65, 130, 0.6),
                                  ),
                                );
                              }
                              return InkWell(
                                  onTap: () {
                                    print(widget.product.id!);
                                    addToCart();
                                  },
                                  child: SafeArea(
                                      child: Image.asset(
                                    "assests/images/img_1.png",
                                    height: 30,
                                    width: 30,
                                  )));
                            },
                            listener: (BuildContext context, Object? state) {
                              if (state is AddToCartSuccessState) {
                                Fluttertoast.showToast(
                                    msg: state.cartResponseEntity.message ??
                                        "No message",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 20.0);
                              }
                              if (state is AddToCartErrorState) {
                                Fluttertoast.showToast(
                                    msg: state.errorMessage ?? "No error message",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.red,
                                    fontSize: 20.0);
                              }
                            },
                          ),
                          // Container(
                          //   height: 44.h,
                          //     width: 48.w,
                          //     decoration: BoxDecoration(
                          //         color: Color.fromRGBO(0, 65, 130, 1),
                          //         shape: BoxShape.circle),
                          //     child: Center(
                          //       child: IconButton(
                          //           onPressed: () {},
                          //           icon: Icon(
                          //             Icons.add_sharp,
                          //             size: 25.sp,
                          //             color: Colors.white,
                          //           )),
                          //     ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer(
                bloc: addToWishListViewModel,
                builder: (BuildContext context, state) {
                  if (state is AddToWishListLoadingState) {
                    return const CircularProgressIndicator(
                      color: Color.fromRGBO(0, 65, 130, 1),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      print(widget.product.id!);
                      addToWishList();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset("assests/images/img.png"),
                    ),
                  );
                },
                listener: (BuildContext context, Object? state) {
                  if (state is AddToWishListSuccessState) {
                    Fluttertoast.showToast(
                        msg: state.wishListEntity.message ?? "No Product Add",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.white,
                        textColor: Colors.green,
                        fontSize: 20.0);
                  } else if (state is AddToWishListErrorState) {
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
                },
              ),
            ],
          ),
        ),
      );
  }

  void addToWishList() {
    addToWishListViewModel.addToWishList(widget.product.id!);
    // addToWishListViewModel.addToWishList("7428c320dc1175abc65ca008");
  }
  void addToCart() {
    addToCartViewModel.addToCart(productId:widget.product.id! );
    // addToWishListViewModel.addToWishList("7428c320dc1175abc65ca008");
  }
}
