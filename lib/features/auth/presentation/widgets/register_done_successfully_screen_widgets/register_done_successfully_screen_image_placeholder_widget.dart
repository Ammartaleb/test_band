import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_band/core/helpers/app_assets.dart';

class RegisterDoneSuccessfullyScreenImagePlaceholderWidget
    extends StatelessWidget {
  const RegisterDoneSuccessfullyScreenImagePlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppImages.registerSuccessSvgImage);
  }
}
