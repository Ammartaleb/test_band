import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/widgets/base_failure_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/home/presentation/cubit/home_cubit.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/banners_section_widget.dart';

class HomeScreenBannersBlocBuilderWidget extends StatelessWidget {
  const HomeScreenBannersBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getBanners(),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (prev, curr) =>
            curr is GetBannersLoading ||
            curr is GetBannersSuccess ||
            curr is GetBannersFailed,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            getBannersLoading: () => const BaseLoadingIndicatorWidget(),
            getBannersFailed: (message) => BaseFailureWidget(
              message: message,
              onPressFunction: () => context.read<HomeCubit>()..getBanners(),
            ),
            getBannersSuccess: (banners) =>
                BannersSectionWidget(banners: banners),
          );
        },
      ),
    );
  }
}
