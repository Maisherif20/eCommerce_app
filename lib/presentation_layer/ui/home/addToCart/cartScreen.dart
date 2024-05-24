import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/DataEnitiy.dart';
import 'package:ecommerce/domain_layer/Entities/getCartResponseEntity/Products.dart';
import 'package:ecommerce/presentation_layer/ui/home/addToCart/deleteFromCartViewModal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../domain_layer/Entities/getCartResponseEntity/ProductEntity.dart';

class CartScreen extends StatefulWidget {
  ProductsEntity productsEntity;
  String price;
  String totalPrice;

  CartScreen(
      {required this.productsEntity,
      required this.price,
      required this.totalPrice});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DeleteFromCartViewModel deleteFromCartViewModel =
      getIt<DeleteFromCartViewModel>();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => deleteFromCartViewModel,
      child: Container(
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
              imageUrl:
                  widget.productsEntity.productEntity?.imageCover ?? "No Image",
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
                        widget.productsEntity.productEntity?.title ??
                            "No Title",
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
                      bloc: deleteFromCartViewModel,
                      builder: (BuildContext context, state) {
                        if (state is DeleteFromCartLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color.fromRGBO(6, 0, 79, 1),
                            ),
                          );
                        }
                        return InkWell(
                            onTap: () {
                              deleteFromCartViewModel.deleteFromCart(
                                  productId: widget.productsEntity.productEntity?.id ?? "" );
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(6, 0, 79, 1),
                            ));
                      },
                      listener: (BuildContext context, Object? state) {
                        if (state is DeleteFromCartErrorState) {
                          Fluttertoast.showToast(
                              msg: state.errorMessage,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20.0);
                        }
                        if (state is DeleteFromCartSuccessState) {
                          Fluttertoast.showToast(
                              msg: state.getCartResponseEntity.status ??
                                  "No message",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
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
                    Text(widget.price),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 42.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 65, 130, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                widget.productsEntity.count! + 1;
                                // widget.totalPrice+= (widget.product.priceAfterDiscount==null?widget.product.price :widget.product.priceAfterDiscount ?? 0)!;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              )),
                          Text(
                            "${widget.productsEntity.count}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                              onPressed: () {
                                widget.productsEntity.count! - 1;
                                // totalPrice-= (widget.product.priceAfterDiscount==null?widget.product.price :widget.product.priceAfterDiscount ?? 0)!;
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.remove_circle_outline_sharp,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
