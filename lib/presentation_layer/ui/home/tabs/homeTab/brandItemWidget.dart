import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain_layer/Entities/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain_layer/Entities/Brand.dart';
class BrandItemWidget extends StatelessWidget {
  Brand brand;
  BrandItemWidget({required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageBuilder: (context , imagePrvider) => Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle ,
            image: DecorationImage(image: imagePrvider , colorFilter:
            ColorFilter.mode(Color.fromRGBO(0, 65, 130, 1), BlendMode.color),)
          ),
        ),
        imageUrl: brand.image!,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
