import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/presentation_layer/ui/core/ex.dart';
import 'package:ecommerce/presentation_layer/ui/home/tabs/ProductScreen/productScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTabItemWidget extends StatelessWidget {
  Category category;
  CategoryTabItemWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ProductsScreen(category: category,).goToWithoutCntext();
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        width: 50.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Color.fromRGBO(0, 65, 130, 1))),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 100.h,
              fit: BoxFit.cover,
              imageUrl: category.image!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Spacer(),
            Text(category.name??"" ,maxLines: 1, overflow: TextOverflow.ellipsis , style: TextStyle(color: Color.fromRGBO(6, 0, 79, 1) , fontSize: 14 , fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
