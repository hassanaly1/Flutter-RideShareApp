import 'package:flutter/material.dart';
import 'package:google_maps/constants/colors.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

AppBar CustomAppBarWidget(
    {required String title,
    List<Widget>? action,
    Widget? leading,
    bool? automaticallyImplyLeading}) {
  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    leading: leading,
    title: CustomTextWidget(text: title, fSize: 20.0, fWeight: FontWeight.w700),
    centerTitle: true,
    backgroundColor: AppAssets.backgroundColor,
    elevation: 0,
    actions: action,
  );
}
