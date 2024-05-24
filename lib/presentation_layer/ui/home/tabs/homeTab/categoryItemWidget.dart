import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:ecommerce/presentation_layer/ui/core/ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ProductScreen/productScreen.dart';
class CategoryItemWidget extends StatelessWidget {
  Category category;
  CategoryItemWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ProductsScreen(category: category,).goTo(context);
      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CachedNetworkImage(
                imageBuilder: (context , imagePrvider) => Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle ,
                    image: DecorationImage(image: imagePrvider)
                  ),
                ),
                imageUrl: category.image!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(category.name??"" , overflow: TextOverflow.ellipsis , style: TextStyle(color: Color.fromRGBO(6, 0, 79, 1) , fontSize: 14 , fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
