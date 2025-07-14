import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/enums/enums.dart';
import 'package:test_band/core/network/api_parameters/query_parameters.dart';
import 'package:test_band/core/widgets/base_failure_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/di/dependency_injection.dart';
import 'package:test_band/features/home/view/widgets/subjects/subject_teachers.dart';
import 'package:test_band/features/home/view_model/home_cubit.dart';

class TeachersBlocBuilder extends StatelessWidget {
  final String educationalGradeId;
  final String subjectId;
  const TeachersBlocBuilder({
    super.key,
    required this.educationalGradeId,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getTeachers(
          queryParameters: GetTeachersApiRequestQueryParameters(
            educationalGradeId: educationalGradeId,
            subjectId: subjectId,
          ),
        ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.teachersRequestStates) {
            case RequestStates.loading:
              return const BaseLoadingIndicatorWidget();
            case RequestStates.success:
              return SubjectTeachers(teachers: state.teachers);
            case RequestStates.failed:
              return BaseFailureWidget(
                message: state.teachersFailureMessage,
                onPressFunction: () => context.read<HomeCubit>()
                  ..getTeachers(
                    queryParameters: GetTeachersApiRequestQueryParameters(
                      educationalGradeId: educationalGradeId,
                      subjectId: subjectId,
                    ),
                  ),
              );
          }
        },
      ),
    );
  }
}
