import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CashImageW extends StatelessWidget {
  const CashImageW(
      {Key? key,
      required this.imageUrl,
      this.fit = BoxFit.contain,
      this.w,
      this.h})
      : super(key: key);
  final String imageUrl;
  final BoxFit fit;
  final double? w;
  final double? h;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      width: w,
      height: h,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator(color: Colors.cyan)),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
