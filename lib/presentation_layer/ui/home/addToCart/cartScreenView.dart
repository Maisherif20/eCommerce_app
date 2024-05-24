import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/presentation_layer/ui/home/addToCart/cartScreen.dart';
import 'package:ecommerce/presentation_layer/ui/home/addToCart/getCartViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreenView extends StatefulWidget {
   num totalPrice=0;

  @override
  State<CartScreenView> createState() => _CartScreenViewtate();
}

class _CartScreenViewtate extends State<CartScreenView> {
  CartViewModel viewModel =getIt<CartViewModel>();

  @override
  void initState() {
    viewModel.getCart();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartStates>(
      bloc: viewModel,
      builder: (BuildContext context, state) {
      if (state is CartSuccessState) {
        if (state.getCartResponseEntity.dataEnitiy?.productsEntity?.isEmpty ?? true)
          {
            return const Center(
              child: Text('No product add to cart yet' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w900 , color: Colors.grey),),
            );
          }
        widget.totalPrice = 0; // Reset totalPrice
        if (state.getCartResponseEntity.dataEnitiy?.totalCartPrice == null) {
          widget.totalPrice = 0;
        } else {
          for (var product in state.getCartResponseEntity.dataEnitiy!
              .productsEntity!) {
            widget.totalPrice += product.price!;
          }
        }}
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    switch (state) {
                      case CartLoadingState():
                        {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      case CartErrorState():
                        {
                          return Center(
                            child: Text(state.errorMessage),
                          );
                        }
                      case CartSuccessState():
                        {
                          if (state.getCartResponseEntity.dataEnitiy?.productsEntity?.isNotEmpty ?? false) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CartScreen(
                                totalPrice: state.getCartResponseEntity.dataEnitiy!.totalCartPrice.toString(),
                                price: state.getCartResponseEntity.dataEnitiy!.productsEntity![index].price.toString(),
                                productsEntity: state.getCartResponseEntity.dataEnitiy!.productsEntity![index],
                              ),
                            );
                          }
                        }
                    }
                    return const SizedBox.shrink(); // Return an empty widget if none of the cases match
                  },
                  itemCount: state is CartSuccessState ? state.getCartResponseEntity.dataEnitiy?.productsEntity!.length : 0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text("Total Price:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(6, 0, 79, 0.6),
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                      Text(widget.totalPrice.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(6, 0, 79, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 40.h,
                    width: 260.w,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 65, 130, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),onPressed: (){}, child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Check out"),
                        SizedBox(width: 5,),
                        Icon(Icons.arrow_forward),
                      ],
                    )),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
