import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/domain_layer/Use%20case/addToWishListUseCase.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/WishListTab/WishListViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/WishListTab/addToWishListViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/WishListTab/wishItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListTab extends StatefulWidget {
  const WishListTab({super.key});

  @override
  State<WishListTab> createState() => _WishListTabState();
}

class _WishListTabState extends State<WishListTab> {
   WishListViewModel wishListViewModel = getIt<WishListViewModel>();
  @override
  void initState() {
    wishListViewModel.getUserWishList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: wishListViewModel,
      builder: (BuildContext context, state) {
      if (state is WishListSuccessState) {
        if (state.productEntity.data?.isEmpty ?? true) {
          return const Center(
            child: Text('No product add to wishList yet', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.grey),),
          );
        }}
        return ListView.builder(
            itemBuilder: (context, index) {
              switch (state) {
                case WishListLoadingState():
                  {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                case WishListErrorState():
                  {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  }
                case WishListSuccessState():
                  {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WishItemWidget(
                        product: state.productEntity.data![index],
                      ),
                    );
                  }
              }
            },
            itemCount: state is WishListSuccessState ? state.productEntity.data!.length : 0);
      },
    );
  }
}
