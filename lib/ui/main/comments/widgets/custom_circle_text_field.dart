import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testnew/core/theme/app_colors.dart';
import 'package:testnew/core/theme/app_text_style.dart';

class CustomCircleTextField extends StatelessWidget {
  final String? labelText;
  final bool? showError;

  final TextEditingController? controller;
  final bool? autoFocus;
  final bool? obscureText;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final Color? backgroundColor;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final Function()? onTap;
  final Widget? prefixIcon;
  final int? maxLines;
  final bool? enabled;
  final bool? enabledTitle;
  final bool? enabledSearchIcon;
  final Widget? suffix;
  final String? titleField;
  final double? width;


  const CustomCircleTextField({
    Key? key,
    this.labelText,
    this.showError,
    this.controller,
    this.autoFocus,
    this.onChanged,
    this.keyboardType,
    this.prefixText,
    this.errorText,
    this.inputAction,
    this.currentFocus,
    this.nextFocus,
    this.hintText,
    this.onTap,
    this.prefixIcon,
    this.backgroundColor = AppColors.white,
    this.obscureText = false,
    this.maxLines,
    this.enabled,
    this.suffix,
    this.enabledTitle,
    this.titleField,
    this.width,
    this.enabledSearchIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextFormField(
            enabled: enabled,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            maxLines: maxLines,
            obscureText: obscureText!,
            controller: controller,
            focusNode: currentFocus,
            onTap: onTap,
            autofocus: autoFocus ?? false,
            textCapitalization: TextCapitalization.sentences,
            onChanged: onChanged,
            onFieldSubmitted: (term) {},
            textInputAction: inputAction,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 17,top: 15, bottom: 15, left: 10),
                child: suffix,
              ),
              filled: true,
              hintText: hintText,
              fillColor: backgroundColor,
              hintStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
              prefixIcon: prefixIcon,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF3F0F6), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF3F0F6), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.assets, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              errorText: showError ?? false ? errorText : null,
            ),
            cursorColor: AppColors.black,
            keyboardType: keyboardType,
          ),
        ),
        enabledTitle ?? false ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.white,
          ),
          margin: const EdgeInsets.only(left: 10),

          height: 20,
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              titleField ?? '',
              style: AppTextStyles.basketOrderPrice
            ),
          ),
        ) : const SizedBox(),
        enabledSearchIcon ?? false ? SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [

            ],
          ),
        ) : const SizedBox(),
      ]
    );
  }
}
