import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/enums/enums.dart';
import 'package:test_band/core/widgets/base_failure_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/home/view/widgets/home_content.dart';
import 'package:test_band/features/home/view_model/home_cubit.dart';

class HomeEducationalGradeBlocBuilder extends StatelessWidget {
  const HomeEducationalGradeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.educationalGradesRequestStates) {
          case RequestStates.loading:
            return const BaseLoadingIndicatorWidget();
          case RequestStates.success:
            return HomeContent(
              educationalGrades: state.educationalGrades,
            );
          case RequestStates.failed:
            return BaseFailureWidget(
              message: state.educationalGradesFailureMessage,
              onPressFunction: () =>
                  context.read<HomeCubit>()..getEducationalGrades(),
            );
        }
      },
    );
  }
}
