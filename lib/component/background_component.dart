import 'package:booking_system_flutter/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BackgroundComponent extends StatelessWidget {
  final String? image;
  final String? text;
  final String? subTitle;
  final double? size;
  final double? height;
  final double? width;

  final bool isError;

  BackgroundComponent({this.image, this.text, this.subTitle, this.size, this.isError = false, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.height(),
      width: width ?? context.width() - 16,
      child: NoDataWidget(
        image: image ?? notDataFoundImg,
        title: text,
        imageSize: Size(size ?? 150, size ?? 150),
        subTitle: subTitle,
      ),
    );
  }
}
