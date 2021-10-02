import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:piaui_app/app/shared/layout/colors.dart';
import 'package:shimmer/shimmer.dart';

class ImageShimmer extends StatefulWidget {
  final String url;

  const ImageShimmer({Key key, this.url}) : super(key: key);

  @override
  _ImageShimmerState createState() => _ImageShimmerState();
}

class _ImageShimmerState extends State<ImageShimmer> {
  @override
  Widget build(BuildContext context) {
    var _bytes = base64.decode(widget.url.split(',').last);
    return Image.memory(_bytes);
  }
}
