import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';

class DropDownWidget<T> extends StatelessWidget {
  final String hintText;
  final String? Function(T?)? onValidate;
  final T? selectedChoice;
  final void Function(T?)? onChangeChoice;
  final List<DropdownMenuItem<T>>? choices;
  final Widget? prefixIcon;

  const DropDownWidget({
    super.key,
    required this.hintText,
    required this.onValidate,
    required this.selectedChoice,
    required this.onChangeChoice,
    required this.choices,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: AppTextStyles.regular.toTextStyle().copyWith(
            color: AppColors.kPrimaryText,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          dropdownColor: AppColors.kWhite,
          decoration: InputDecoration(
            errorMaxLines: 2,
            filled: true,
            fillColor: AppColors.kSemantic,
            prefixIcon: prefixIcon,
            hintStyle: AppTextStyles.regular.toTextStyle().copyWith(
              color: AppColors.kHint,
              fontSize: 12,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.5),
              borderSide: BorderSide.none,
            ),
            errorStyle: AppTextStyles.regular.toTextStyle().copyWith(
              color: AppColors.kError,
              fontSize: 12,
            ),
          ),
          style: AppTextStyles.regular.toTextStyle().copyWith(
            fontSize: 12,
            color: AppColors.kPrimaryText,
          ),
          validator: onValidate,
          items: choices,
          value: selectedChoice,
          icon: SizedBox(
            height: 17,
            width: 17,
            child: SvgPicture.asset(
              AppIcons.iconArrowDown,
              color: AppColors.kPrimary,
            ),
          ),
          onChanged: onChangeChoice,
          hint: Text(hintText, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
