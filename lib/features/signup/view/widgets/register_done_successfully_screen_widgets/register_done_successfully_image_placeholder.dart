import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_band/core/helpers/app_assets.dart';

class RegisterDoneSuccessfullyImagePlaceholder extends StatelessWidget {
  const RegisterDoneSuccessfullyImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppImages.registerSuccessSvgImage);
  }
}
