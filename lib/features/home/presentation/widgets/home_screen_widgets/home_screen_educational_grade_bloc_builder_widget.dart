import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/widgets/base_failure_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/home/presentation/cubit/home_cubit.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/home_screen_content_widget.dart';

class HomeScreenEducationalGradeBlocBuilderWidget extends StatelessWidget {
  const HomeScreenEducationalGradeBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) =>
          curr is GetEducationalGradesLoading ||
          curr is GetEducationalGradesSuccess ||
          curr is GetEducationalGradesFailed,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          getEducationalGradesLoading: () => const BaseLoadingIndicatorWidget(),
          getEducationalGradesFailed: (message) => BaseFailureWidget(
            message: message,
            onPressFunction: () =>
                context.read<HomeCubit>()..getEducationalGrades(),
          ),
          getEducationalGradesSuccess: (educationalGrades) =>
              HomeScreenContentWidget(educationalGrades: educationalGrades),
        );
      },
    );
  }
}
