import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/enums/enums.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/core/network/api_parameters/query_parameters.dart';
import 'package:test_band/core/widgets/base_failure_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/home/view/widgets/subjects/subjects_section.dart';
import 'package:test_band/features/home/view_model/home_cubit.dart';

class HomeSubjectsBlocBuilder extends StatelessWidget {
  final String educationalGradeId;
  const HomeSubjectsBlocBuilder({
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
        builder: (context, state) {
          switch (state.subjectsRequestStates) {
            case RequestStates.loading:
              return const BaseLoadingIndicatorWidget();
            case RequestStates.success:
              return SubjectsSection(
                educationalGradeId: educationalGradeId,
                subjects: state.subjects,
              );
            case RequestStates.failed:
              return BaseFailureWidget(
                message: state.subjectsFailureMessage,
                onPressFunction: () => context.read<HomeCubit>()
                  ..getSubjects(
                    queryParameters: GetSubjectsApiRequestQueryParameters(
                      educationalGradeId: educationalGradeId,
                    ),
                  ),
              );
          }
        },
      ),
    );
  }
}
