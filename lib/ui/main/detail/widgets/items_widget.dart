import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:testnew/core/theme/app_colors.dart';
import 'package:testnew/core/theme/app_text_style.dart';

class CItemsWidget extends StatelessWidget {
  const CItemsWidget();
  @override
  Widget build(BuildContext context) {
    return  FullScreenWidget(
      child: Hero(
        tag: "customTag",
        child: ClipRRect(
          borderRadius:
          BorderRadius.circular(16),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: '',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}