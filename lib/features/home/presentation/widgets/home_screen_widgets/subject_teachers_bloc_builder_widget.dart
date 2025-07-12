import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_band/core/di/dependency_injection.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/networking/api_parameters/query_parameters.dart';
import 'package:test_band/core/widgets/base_failure_widget.dart';
import 'package:test_band/core/widgets/base_loading_indicator_widget.dart';
import 'package:test_band/features/home/domain/entities/teacher_response_entity.dart';
import 'package:test_band/features/home/presentation/cubit/home_cubit.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/subject_courses_widget.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/subject_teachers_widget.dart';

class SubjectTeachersBlocBuilderWidget extends StatelessWidget {
  final String subjectId;
  final String educationalGradeId;
  const SubjectTeachersBlocBuilderWidget({
    super.key,
    required this.subjectId,
    required this.educationalGradeId,
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
        buildWhen: (prev, curr) =>
            curr is GetTeachersFailed ||
            curr is GetTeachersLoading ||
            curr is GetTeachersSuccess,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            getTeachersLoading: () => const BaseLoadingIndicatorWidget(),
            getTeachersFailed: (message) => BaseFailureWidget(
              message: message,
              onPressFunction: () => context.read<HomeCubit>()
                ..getTeachers(
                  queryParameters: GetTeachersApiRequestQueryParameters(
                    educationalGradeId: educationalGradeId,
                    subjectId: subjectId,
                  ),
                ),
            ),
            getTeachersSuccess: (teachers) =>
                SubjectTabContentWidget(teachers: teachers),
          );
        },
      ),
    );
  }
}

class SubjectTabContentWidget extends StatefulWidget {
  final List<TeacherEntity> teachers;
  const SubjectTabContentWidget({super.key, required this.teachers});

  @override
  State<SubjectTabContentWidget> createState() =>
      _SubjectTabContentWidgetState();
}

class _SubjectTabContentWidgetState extends State<SubjectTabContentWidget> {
  List<TeacherEntity> _teachers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  _init() {
    _teachers = widget.teachers;
    _teachers = AppConsts.teachers;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubjectTeachersWidget(
          teachers: _teachers,
        ),
        const SizedBox(height: 16),
        const SubjectCoursesWidget(),
      ],
    );
  }
}
