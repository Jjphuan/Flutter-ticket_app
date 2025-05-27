import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFrom extends StatelessWidget {
  final String? label;
  final Color? labelColor;
  final Color? cursorColor;
  final String? prefixLabel;
  final String? suffixLabel;
  final double? width;
  final FontWeight? fontWeight;
  final String? hintText;
  final String? errorText;
  final TextInputType? textInputType;
  final int? maxLength;
  final bool? filled;
  final bool obscureText;
  final TextStyle? prefixStyle;
  final TextCapitalization textCapitalization;
  final void Function()? onTap;
  final void Function(String)? onChange;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  const CustomTextFrom({
    super.key,
    this.label,
    this.labelColor,
    this.prefixLabel,
    this.suffixLabel,
    this.width,
    this.fontWeight,
    this.hintText,
    this.errorText,
    this.textInputType,
    this.maxLength,
    this.filled,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.onChange,
    this.onTapOutside,
    this.onEditingComplete,
    this.inputFormatters,
    this.controller,
    this.prefixStyle,
    this.cursorColor,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5.0),
        SizedBox(
          // height: 46,
          // width: width,
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            style: AppStyle.headTextSmaller.copyWith(
                fontSize: 18,
                color: Colors.black
            ),
            cursorHeight: 16,
            keyboardType: textInputType ?? TextInputType.text,
            cursorColor: cursorColor,
            cursorRadius: const Radius.circular(5),
            onTap: onTap,
            onChanged: onChange,
            onTapOutside: onTapOutside,
            onEditingComplete: onEditingComplete,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            maxLength: maxLength,
            decoration: InputDecoration(
              // label != null
              //     ? Text(
              //   label!,
              //   style: TextStyle(fontSize: 12, color: labelColor ?? Colour.grey16),
              // )
              errorText: errorText,
              counterText: '',
              contentPadding: EdgeInsets.zero,
              hintText: hintText,
              hintStyle: AppStyle.headTextSmaller.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey
              ),
              prefixIconConstraints: prefixLabel != null ? null : BoxConstraints
                  .tight(const Size(10, 20)),
              prefixIcon: prefixLabel != null
                  ? Padding(
                padding: const EdgeInsets.only(left: 12, top: 15),
                child: Text(
                  prefixLabel!,
                  style: prefixStyle,
                ),
              )
                  : Container(
                width: 0, // Ensure it takes up no space if prefixLabel is null
              ),
              suffixIcon: suffixLabel != null
                  ? Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Transform.scale(
                  scale: 0.4,
                  child: Image.asset(suffixLabel!, width: 10, height: 10),
                ),
              )
                  : null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: suffixLabel == 'assets/icons/icon_validate.png'
                          ? Colors.lightBlueAccent
                          : Colors.blue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue.shade500,width: 2)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
        ),
      ],
    );
  }

}