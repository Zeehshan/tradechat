import 'package:flutter/material.dart';

Widget fileIcon(String extension, [Color? color]) {
  switch (extension.toLowerCase()) {
    case '.pdf':
      return Icon(
        Icons.picture_as_pdf,
        color: color ?? Colors.white,
      );
    case '.mp4':
      return Icon(
        Icons.video_collection_rounded,
        color: color ?? Colors.white,
      );
    case '.excel':
      return Icon(
        Icons.file_copy_sharp,
        color: color ?? Colors.white,
      );
    case '.jpeg':
    case '.jpg':
    case '.png':
      return Icon(
        Icons.camera_alt_rounded,
        color: color ?? Colors.white,
      );
    default:
      return Icon(
        Icons.file_copy,
        color: color ?? Colors.white,
      );
  }
}
