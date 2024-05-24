import 'package:ecommerce/presentation_layer/ui/core/ex.dart';
import 'package:ecommerce/presentation_layer/ui/core/local/prefsHelper.dart';
import 'package:ecommerce/presentation_layer/ui/home/addToCart/cartScreen.dart';
import 'package:ecommerce/presentation_layer/ui/home/addToCart/cartScreenView.dart';
import 'package:ecommerce/presentation_layer/ui/home/homeScreenViewModel.dart';
import 'package:ecommerce/presentation_layer/ui/home/searchWidget.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/CategoriesTab/categoriesTab.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProfileTab/profileTab.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/WishListTab/wishListTab.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/homeTab/homeTabView.dart';
import 'package:ecommerce/presentation_layer/ui/signIn/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();


  int selectedIndex = 0;
  Widget tabPreview = HomeTabView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
        bloc: viewModel,
        builder: (BuildContext context, state) {
          if (state is HomeTabState) {
            tabPreview = HomeTabView();
          } else if (state is CategoriesTabState) {
            tabPreview = CategoriesTab();
          } else if (state is WishListTabState) {
            tabPreview = WishListTab();
          } else if (state is ProfileTabState) {
            tabPreview = ProfileTab();
          }
          else if (state is CartTabState) {
            tabPreview = CartScreenView();
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Ecommerce App",
                style: TextStyle(
                    color: Color.fromRGBO(0, 65, 130, 1), fontSize: 30),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                      onTap: () {
                        PrefsHelper.logout();
                        SignInScreen().goTo(context);
                      },
                      child: const Row(
                        children: [
                          Text("Log out" , style: TextStyle(color: Color.fromRGBO(0, 65, 130, 1)),),
                          SizedBox(width: 5,),
                          Icon(
                            Icons.logout,
                            color: Color.fromRGBO(0, 65, 130, 1),
                            size: 25,
                          ),
                        ],
                      )),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                selectedIndex = index;
                viewModel.getTabs(selectedIndex);
              },
              currentIndex: selectedIndex,
              backgroundColor: Color.fromRGBO(0, 65, 130, 1),
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(0, 65, 130, 1),
                    icon: selectedIndex == 0
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ImageIcon(
                              AssetImage("assests/images/img_2.png"),
                              size: 40.sp,
                            ))
                        : ImageIcon(
                            AssetImage("assests/images/img_2.png"),
                            size: 40.sp,
                          ),
                    label: ""),
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(0, 65, 130, 1),
                    icon: selectedIndex == 1
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ImageIcon(
                              AssetImage("assests/images/img_3.png"),
                              size: 30.sp,
                            ),
                          )
                        : ImageIcon(
                            AssetImage("assests/images/img_3.png"),
                            size: 30.sp,
                          ),
                    label: ""),
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(0, 65, 130, 1),
                    icon: selectedIndex == 2
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ImageIcon(
                                AssetImage("assests/images/img_4.png"),
                                size: 40.sp),
                          )
                        : ImageIcon(AssetImage("assests/images/img_4.png"),
                            size: 40.sp),
                    label: ""),
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(0, 65, 130, 1),
                    icon: selectedIndex == 3
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ImageIcon(
                              AssetImage(
                                "assests/images/img_5.png",
                              ),
                              size: 20.sp,
                            ),
                          )
                        : ImageIcon(
                            AssetImage(
                              "assests/images/img_5.png",
                            ),
                            size: 20.sp,
                          ),
                    label: ""),
                BottomNavigationBarItem(
                    backgroundColor: Color.fromRGBO(0, 65, 130, 1),
                    icon: selectedIndex == 4
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Color.fromRGBO(0, 65, 130, 1),
                            )
                          )
                        : Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    label: "")
              ],
            ),
            body: Column(
              children: [
                Visibility(visible:!isProfileTab(),
                    child: SearchWidget()),
                Expanded(child: tabPreview),
              ],
            ),
          );
        });
  }
  bool isProfileTab() {
    return tabPreview is ProfileTab;
  }
}
