import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testnew/core/theme/app_colors.dart';
import 'package:testnew/core/theme/app_text_style.dart';

class CellUserWidget extends StatelessWidget {
  final String? text;
  final String? surName;
  final Function()? onPressed;

  const CellUserWidget({
    this.text = '',
    this.surName = '',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.green.withOpacity(0.4),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                color: Color.fromRGBO(96, 57, 158, 0.07),
                blurRadius: 20,
              ),
              BoxShadow(
                offset: Offset(0, 3),
                color: Color.fromRGBO(96, 57, 158, 0.0503198),
                blurRadius: 20,
              ),
              BoxShadow(
                offset: Offset(0, 3),
                color: Color.fromRGBO(96, 57, 158, 0.0417275),
                blurRadius: 20,
              ),
              BoxShadow(
                offset: Offset(0, 3),
                color: Color.fromRGBO(96, 57, 158, 0.035),
                blurRadius: 20,
              ),
              BoxShadow(
                offset: Offset(0, 3),
                color: Color.fromRGBO(96, 57, 158, 0.0282725),
                blurRadius: 20,
              ),
              BoxShadow(
                offset: Offset(0, 3),
                color: Color.fromRGBO(96, 57, 158, 0.0196802),
                blurRadius: 20,
              ),
            ]),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text ?? '',
                  style: AppTextStyles.appBarTitle.copyWith(
                      color: AppColors.mainColor2,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  surName ?? '',
                  style: AppTextStyles.appBarTitle.copyWith(
                      color: AppColors.mainColor2,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),

              ],
            ),
            Text(
              '${Random().nextInt(1000)}',
              style: AppTextStyles.appBarTitle.copyWith(
                  color: AppColors.mainColor2,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
