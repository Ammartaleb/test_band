import 'package:flutter/material.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/subject_teachers_bloc_builder_widget.dart';

class SubjectsTabsWidget extends StatelessWidget {
  final TabController? tabController;
  final List<SubjectEntity> subjects;
  final String educationalGradeId;
  const SubjectsTabsWidget({
    super.key,
    this.tabController,
    required this.subjects,
    required this.educationalGradeId,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: subjects.map((subject) {
          return SubjectTeachersBlocBuilderWidget(
            subjectId: subject.id.toString(),
            educationalGradeId: educationalGradeId,
          );
        }).toList(),
      ),
    );
  }
}
