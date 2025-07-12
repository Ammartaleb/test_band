import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/networking/api_parameters/query_parameters.dart';
import 'package:test_band/core/widgets/base_failure_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/home/presentation/cubit/home_cubit.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/subjects_section_widget.dart';

class HomeScreenSubjectsBlocBuilderWidget extends StatelessWidget {
  final String educationalGradeId;
  const HomeScreenSubjectsBlocBuilderWidget({
    super.key,
    required this.educationalGradeId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getSubjects(
          queryParameters: GetSubjectsApiRequestQueryParameters(
            educationalGradeId: educationalGradeId,
          ),
        ),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (prev, curr) =>
            curr is GetSubjectsLoading ||
            curr is GetSubjectsSuccess ||
            curr is GetSubjectsFailed,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            getSubjectsLoading: () => const BaseLoadingIndicatorWidget(),
            getSubjectsFailed: (message) => BaseFailureWidget(
              message: message,
              onPressFunction: () => context.read<HomeCubit>()
                ..getSubjects(
                  queryParameters: GetSubjectsApiRequestQueryParameters(
                    educationalGradeId: educationalGradeId,
                  ),
                ),
            ),
            getSubjectsSuccess: (subjects) => SubjectsSectionWidget(
              educationalGradeId: educationalGradeId,
              subjects: subjects,
            ),
          );
        },
      ),
    );
  }
}
