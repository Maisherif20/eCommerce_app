import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/domain_layer/Entities/productResponse/Product.dart';
import 'package:ecommerce/presentation_layer/ui/home/addToCart/addToCartViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product product;

  ProductDetailsScreen({required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  AddToCartViewModel addToCartViewModel = getIt<AddToCartViewModel>();
  int pageIndex = 0;
  int count = 0;
  num totalPrice=0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>addToCartViewModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(0, 65, 130, 1),
              size: 25,
            ),
          ),
          title: const Text(
            "Product Details",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 65, 130, 1)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Color.fromRGBO(0, 65, 130, 1),
                size: 25,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(25)),
                width: 368.w,
                height: 300.h,
                child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: widget.product.images![index] ?? "",
                      fit: BoxFit.fitHeight,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    );
                  },
                  itemCount: widget.product.images!.length,
                  onPageChanged: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                color: Colors.transparent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        widget.product.images!.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                onTap: () {
                                  pageController.animateToPage(index,
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                child: CircleAvatar(
                                  radius: 6.r,
                                  backgroundColor: pageIndex == index
                                      ? const Color.fromRGBO(0, 65, 130, 1)
                                      : Colors.grey,
                                ),
                              ),
                            ))),
              ),
              Row(
                children: [
                  SizedBox(
                      width: 300.w,
                      child: Text(
                        widget.product.title ?? "",
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color.fromRGBO(6, 0, 79, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                  Spacer(),
                  const Text("EGP ",
                      style: TextStyle(
                          color: Color.fromRGBO(6, 0, 79, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  Text(
                      widget.product.priceAfterDiscount == null
                          ? widget.product.price.toString()
                          : widget.product.priceAfterDiscount.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(6, 0, 79, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.blueGrey)),
                    child: Text("${widget.product.sold} Sold",
                        style: const TextStyle(
                            color: Color.fromRGBO(6, 0, 79, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Text(
                          " ${widget.product.ratingsAverage} ( ${widget.product.ratingsQuantity} )",
                          style: const TextStyle(
                              color: Color.fromRGBO(6, 0, 79, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Spacer(),
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
                              count++;
                              totalPrice+= (widget.product.priceAfterDiscount==null?widget.product.price :widget.product.priceAfterDiscount ?? 0)!;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            )),
                        Text(
                          "${count}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                            onPressed: () {
                              count--;
                              totalPrice-= (widget.product.priceAfterDiscount==null?widget.product.price :widget.product.priceAfterDiscount ?? 0)!;
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
              const Text("Description",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(6, 0, 79, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              Text("${widget.product.description?.replaceAll("\n", ", ")}" ?? "There is no description",
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Color.fromRGBO(6, 0, 79, 0.6),
                      fontSize: 14,
                    fontWeight: FontWeight.w300
                     )),
              SizedBox(height: 30.h,),
              Row(
                children: [
                   Column(
                    children: [
                      const Text("Total Price:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(6, 0, 79, 0.6),
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                      Text("${totalPrice}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(6, 0, 79, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Spacer(),
                  BlocConsumer(
                    bloc: addToCartViewModel,
                    builder: (BuildContext context, state) {
                      if (state is AddToCartLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(0, 65, 130, 1),
                          ),
                        );
                      }
                      return Container(
                        height: 40.h,
                        width: 270.w,
                        child: ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 65, 130, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),onPressed: (){
                          addToCartViewModel.addToCart(productId: widget.product.id!);
                        }, child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_shopping_cart_rounded),
                            SizedBox(width: 5,),
                            Text("Add to cart"),
                          ],
                        )),
                      );
                    },
                    listener: (BuildContext context, Object? state) {
                      if (state is AddToCartSuccessState) {
                        Fluttertoast.showToast(
                            msg: state.cartResponseEntity.message ?? "No Product Add",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 20.0);
                      } else if (state is AddToCartErrorState) {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
