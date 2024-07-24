import 'package:chartvault/const/values.dart';
import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      placeHolder,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
