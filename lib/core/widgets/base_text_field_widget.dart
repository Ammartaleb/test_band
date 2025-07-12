import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/utils/app_extensions.dart';

class BaseTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final bool enabled;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTapFunction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int maxLines;
  final int? maxLength;
  final bool alignLabelWithHint;
  final TextDirection? hintTextDirection;
  final bool autoFocus;
  final int errorMaxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool isReadOnly;
  final BoxConstraints? prefixIconConstraints;
  final String labelText;

  const BaseTextFieldWidget({
    super.key,
    this.autoFocus = false,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.enabled = true,
    this.isReadOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onChanged,
    this.onTapFunction,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.maxLength,
    this.alignLabelWithHint = true,
    this.hintTextDirection,
    this.errorMaxLines = 2,
    this.inputFormatters,
    this.prefixIconConstraints,
    required this.labelText,
  });

  @override
  State<BaseTextFieldWidget> createState() => _BaseTextFieldWidgetState();
}

class _BaseTextFieldWidgetState extends State<BaseTextFieldWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppTextStyles.regular.toTextStyle().copyWith(
            color: AppColors.kPrimaryText,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscuringCharacter: "*",
          autofocus: widget.autoFocus,
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          readOnly: widget.isReadOnly,
          onTap: widget.onTapFunction,
          onTapOutside: (event) => context.unFocus(),
          style: AppTextStyles.regular.toTextStyle().copyWith(
            fontSize: 12,
            color: AppColors.kPrimaryText,
          ),
          inputFormatters: widget.inputFormatters,
          textDirection: getTextDirection(keyboardType: widget.keyboardType),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.kSemantic,
            hintText: getHintText(
              keyboardType: widget.keyboardType,
              hintText: widget.hintText,
            ),
            hintStyle: AppTextStyles.regular.toTextStyle().copyWith(
              color: AppColors.kHint,
              fontSize: 12,
            ),
            hintTextDirection: getHintTextDirection(
              keyboardType: widget.keyboardType,
            ),
            errorStyle: AppTextStyles.regular.toTextStyle().copyWith(
              color: AppColors.kError,
              fontSize: 12,
            ),
            alignLabelWithHint: widget.alignLabelWithHint,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: widget.prefixIcon,
            ),
            prefixIconConstraints: widget.prefixIconConstraints,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.kPrimary,
                      size: 20,
                    ),
                    onPressed: () => setState(() {
                      _obscureText = !_obscureText;
                    }),
                  )
                : widget.suffixIcon,
            errorMaxLines: widget.errorMaxLines,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.5),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

TextDirection? getTextDirection({required TextInputType keyboardType}) {
  return keyboardType == TextInputType.phone ? TextDirection.ltr : null;
}

TextDirection? getHintTextDirection({required TextInputType keyboardType}) {
  return keyboardType == TextInputType.phone ? TextDirection.ltr : null;
}

String? getHintText({
  required TextInputType keyboardType,
  required String? hintText,
}) {
  return keyboardType == TextInputType.phone ? "+9647xxxxxxxxx" : hintText;
}
