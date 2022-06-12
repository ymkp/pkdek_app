import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke/shared/widgets/small_loading_widget.dart';

/// Caching image from URL
/// passing it as image decoration in container
class CustomCachedImageContainer extends StatelessWidget {
  const CustomCachedImageContainer({
    required this.imageURL,
    this.height,
    this.width,
    this.margin,
    this.child,
  });
  final String imageURL;
  final double? height;
  final double? width;
  final Widget? child;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    if (imageURL.isEmpty) {
      return const SizedBox();
    } else {
      return CachedNetworkImage(
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => Container(
          margin: EdgeInsets.only(bottom: margin ?? 0),
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? MediaQuery.of(context).size.width * 0.67,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        ),
        imageUrl: imageURL,
        errorWidget: (context, e, dynamic) {
          return Container(
            height: height ?? 50,
            width: width ?? 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey[200]!,
              ),
            ),
            child: const Icon(
              Icons.image_not_supported,
              color: Colors.grey,
            ),
          );
        },
        placeholder: (context, e) {
          return Container(
            width: width ?? 50,
            height: height ?? 50,
            alignment: Alignment.center,
            child: const SmallLoadingWidget(),
          );
          // return const ShimmerRectangleWidget(
          //   height: 50,
          //   width: 50,
          //   baseColor: kGrey2,
          //   highLightColor: kGrey0,
          // );
        },
      );
    }
  }
}
