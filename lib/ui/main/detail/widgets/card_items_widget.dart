import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testnew/core/theme/app_colors.dart';
import 'package:testnew/core/theme/app_text_style.dart';

class CardItemsWidget extends StatelessWidget {

  final String? title;
  final String? email;
  final String? desc;
  const CardItemsWidget({this.title, this.desc, this.email });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.lightGreenAccent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(100),
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
                ]),
            child: Image.asset('assets/png/user.png'),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(email ?? ''),
                SizedBox(height: 10),
                Text(title ?? '', style: AppTextStyles.appBarTitle, maxLines: 3,),
                SizedBox(height: 10),
                Text(desc ?? ''),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${Random().nextInt(1000)}',
                  style: AppTextStyles.appBarTitle.copyWith(
                      color: AppColors.mainColor2,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(width: 3),
                Image.asset(
                  'assets/png/like.png',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}