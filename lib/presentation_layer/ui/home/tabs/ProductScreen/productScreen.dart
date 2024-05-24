import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/presentation_layer/ui/home/searchWidget.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProductScreen/productViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/widgets/productItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  Category category;
  ProductsScreen({required this.category});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductViewModel viewModel = getIt<ProductViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.initPage(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_outlined , color: Color.fromRGBO(0, 65, 130, 1),)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.category.name??"" , style: TextStyle(color: Color.fromRGBO(0, 65, 130, 1) , fontSize: 30),),
      ),
      body: Column(
        children: [
          SearchWidget(),
          Expanded(
            child: BlocBuilder(
              bloc: viewModel,
              builder: (BuildContext context, state) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 10 / 10),
                    itemBuilder: (context, index) {
                      switch (state) {
                        case LoadingState():
                          {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        case ErrorState():
                          {
                            return Center(
                              child: Text(state.errorMessage),
                            );
                          }
                        case SuccessState():
                          {
                            return ProductItemWidget(
                              product: state.products.data![index],
                              id: state.products.data![index].id!,
                            );
                          }
                      }
                    },
                    itemCount: state is SuccessState ? state.products.data!.length : 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
