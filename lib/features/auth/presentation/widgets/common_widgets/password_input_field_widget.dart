import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/widgets/base_text_field_widget.dart';

class PasswordInputFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String text;
  final String? Function(String?)? onValidate;

  const PasswordInputFieldWidget({
    super.key,
    required this.textEditingController,
    this.text = "كلمة المرور",
    this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFieldWidget(
      controller: textEditingController,
      keyboardType: TextInputType.visiblePassword,
      isPassword: true,
      labelText: text,
      hintText: text,
      validator: onValidate,
      prefixIcon: SizedBox(
        width: 17,
        height: 17,
        child: SvgPicture.asset(AppIcons.iconKey, color: AppColors.kPrimary),
      ),
    );
  }
}
