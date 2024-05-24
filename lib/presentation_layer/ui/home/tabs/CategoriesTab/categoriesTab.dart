import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/CategoriesTab/categoryViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/homeTab/categoryItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categoryTabItemWidget.dart';

class CategoriesTab extends StatefulWidget {
  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  CategoryTabViewModel viewModel = getIt<CategoryTabViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (BuildContext context, state) {
        return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
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
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CategoryTabItemWidget(
                          category: state.categories![index]),
                    );
                  }
              }
            },itemCount: state is SuccessState? state.categories!.length:0);
      },
    );
  }
}
