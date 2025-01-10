import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CGCachedImage extends StatefulWidget {
  const CGCachedImage({super.key, required this.imageUrl, this.fit});
  final String imageUrl;
  final BoxFit? fit;

  @override
  State<CGCachedImage> createState() => _CGCachedImageState();
}

class _CGCachedImageState extends State<CGCachedImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      fit: widget.fit,
      placeholder: (context, url) => Container(
        color: AppColors.scaffoldLight,
        child: const Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 3))),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
