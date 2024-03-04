import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/colors.dart';
import '../res/styles.dart';

class SimpleInputField extends StatefulWidget {
  SimpleInputField(
    this.buttonIcon,
    this.buttonIconPress, {
    super.key,
    this.placeHolder,
    this.controller,
    this.icon,
    this.isPassword = false,
    this.isNumeric = false,
    this.maxLen,
  });

  final String? placeHolder;
  final TextEditingController? controller;
  final IconData? icon;
  final int? maxLen;
  final bool? isPassword;
  final bool? isNumeric;
  final IconData? buttonIcon;
  Function buttonIconPress;

  @override
  SimpleInputFieldState createState() => SimpleInputFieldState();
}

class SimpleInputFieldState extends State<SimpleInputField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 300,
          child: TextField(
            controller: widget.controller,
            style: appNormalBlackText,
            maxLength: widget.maxLen ?? 30,
            obscureText: widget.isPassword!,
            keyboardType: widget.isPassword!
                ? const TextInputType.numberWithOptions(signed: false)
                : widget.isNumeric!
                    ? TextInputType.number
                    : TextInputType.text,
            inputFormatters: widget.isNumeric!
                ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                : null,
            decoration: InputDecoration(
              counterText: "",
              contentPadding: const EdgeInsets.only(right: 8, left: 8),
              hintText: widget.placeHolder,
              hintStyle: appNormalBlackText.copyWith(
                  fontSize: 14, color: lightDividerColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: lightGreyColor.withOpacity(0.7)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: primaryColor),
              ),
              filled: true,
              focusColor: whiteColor,
              fillColor: whiteColor,
              suffixIcon: widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: primaryColor,
                    )
                  : null,
            ),
          ),
        ),
        if (widget.buttonIcon != null)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: lightPrimaryColor, width: 1),
                  color: whiteColor),
              width: 46,
              height: 50,
              child: IconButton(
                onPressed: () {
                  widget.buttonIconPress();
                },
                icon: const Icon(
                  Icons.check,
                  color: primaryColor,
                ),
              ),
            ),
          )
      ],
    );
  }
}
