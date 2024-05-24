import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/presentation_layer/ui/home/searchWidget.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/homeTab/brandItemWidget.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/homeTab/categoryItemWidget.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/homeTab/homeTabViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/productItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeTabViewModel homeTabViewModel = getIt<HomeTabViewModel>();
  @override
  void initState() {
    homeTabViewModel.initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
        bloc: homeTabViewModel,
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ErrorState():
              {
                return Column(
                  children: [
                    Expanded(child: Text(state.errorMessage)),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                  ],
                );
              }
            case SuccessState():
              {
                var categories = state.categories;
                var brands = state.brands;
                var products = state.products;
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                      color: Color.fromRGBO(6, 0, 79, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                              itemBuilder: (context, index) =>
                                  CategoryItemWidget(
                                      category: categories![index]),
                              itemCount: categories!.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) =>
                              BrandItemWidget(brand: brands![index]),
                          itemCount: brands!.length,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 270.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              ProductItemWidget(product: products!.data![index], id:products.data![index].id! ,),
                          itemCount: products?.data!.length,
                        ),
                      ),
                    ),
                  ],
                );
              }
          }
        });
  }
}
