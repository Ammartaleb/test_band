import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/helpers/app_validators.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/widgets/base_text_field_widget.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class BasePhoneNumberInputField extends StatefulWidget {
  final TextEditingController textEditingController;

  const BasePhoneNumberInputField({
    super.key,
    required this.textEditingController,
  });

  @override
  State<BasePhoneNumberInputField> createState() =>
      _BasePhoneNumberInputFieldState();
}

class _BasePhoneNumberInputFieldState
    extends State<BasePhoneNumberInputField> {
  final prefix = "+964";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  _init() {
    // Listen to changes and force the prefix
    widget.textEditingController.addListener(() {
      if (!widget.textEditingController.text.startsWith(prefix)) {
        widget.textEditingController.text = prefix;
        widget.textEditingController.selection = TextSelection.collapsed(
          offset: prefix.length,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextFieldWidget(
      controller: widget.textEditingController,
      keyboardType: TextInputType.phone,
      inputFormatters: [MaskedInputFormatter("##############")],
      labelText: "رقم الهاتف",
      hintText: "رقم الهاتف",
      validator: (input) =>
          getIt<AppValidators>().validatePhoneNumberInputField(input: input),
      prefixIcon: SizedBox(
        width: 17,
        height: 17,
        child: SvgPicture.asset(AppIcons.iconPhone, color: AppColors.kPrimary),
      ),
    );
  }
}
