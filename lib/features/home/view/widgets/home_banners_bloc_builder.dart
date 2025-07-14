import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/enums/enums.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/core/widgets/base_failure_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/home/view/widgets/banners/banners_section.dart';
import 'package:test_band/features/home/view_model/home_cubit.dart';

class HomeBannersBlocBuilder extends StatelessWidget {
  const HomeBannersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getBanners(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.bannersRequestStates) {
            case RequestStates.loading:
              return const BaseLoadingIndicatorWidget();
            case RequestStates.success:
              return BannersSection(banners: state.banners);
            case RequestStates.failed:
              return BaseFailureWidget(
                message: state.bannersFailureMessage,
                onPressFunction: () => context.read<HomeCubit>()..getBanners(),
              );
          }
        },
      ),
    );
  }
}
