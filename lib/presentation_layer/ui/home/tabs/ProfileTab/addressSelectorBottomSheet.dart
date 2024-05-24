
import 'package:ecommerce/DI/dI.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProfileTab/getAddressViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProfileTab/profileTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../core/local/provider.dart';
import 'addressReview.dart';

class AddressSelectorBottomSheet extends StatefulWidget {
  @override
  State<AddressSelectorBottomSheet> createState() => _AddressSelectorBottomSheetState();
}

class _AddressSelectorBottomSheetState extends State<AddressSelectorBottomSheet> {
  GetAddressViewModel getAddressViewModel = getIt<GetAddressViewModel>();
  @override
  void initState() {
    getAddressViewModel.getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAddressViewModel, GetAddressStates>(
      bloc: getAddressViewModel,
      builder: (context, state) {
        switch (state) {
          case GetAddressLoadingState():
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case GetAddressErrorState():
            {
              print(state.errorMessage);
              return Center(
                child: Text(state.errorMessage,
                    style: const TextStyle(color: Colors.yellow)),
              );
            }
          case GetAddressSuccessState():
            {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Your Addresses" ,textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(6, 0, 79, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(top: 10 , left: 10 , right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Address ${index+1} :" , style: const TextStyle(
                                color: Color.fromRGBO(6, 0, 79, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),),
                            InkWell(onTap: (){
                              Navigator.pop(context ,state.addressEntity.data![index] );
                            },
                              child: AddressReview(
                                  homeDeatils: state.addressEntity.data![index].details ?? "No Details",
                                  city: state.addressEntity.data![index].city ?? "No City"),
                            ),
                          ],
                        ),
                      ),
                      itemCount: state.addressEntity.data?.length ?? 0,
                    ),
                  ),
                ],
              );
            }
        }
        return const Text("Empty..", style: TextStyle(color: Colors.yellow));
      },
    );
  }
}
