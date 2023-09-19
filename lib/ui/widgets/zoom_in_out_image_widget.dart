// ignore_for_file: depend_on_referenced_packages

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ZoomInOutImageWidget extends StatelessWidget {
  final String path;
  const ZoomInOutImageWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        panEnabled: false, // Set it to false
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.5,
        child: SizedBox.expand(
          child: CachedNetworkImage(
            imageUrl: path,
            fit: BoxFit.contain,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
