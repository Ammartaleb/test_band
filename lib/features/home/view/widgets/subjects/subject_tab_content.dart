import 'package:flutter/material.dart';
import 'package:test_band/features/home/view/widgets/subjects/subject_courses.dart';
import 'package:test_band/features/home/view/widgets/subjects/teachers_bloc_builder.dart';

class SubjectTabContent extends StatelessWidget {
  final String educationalGradeId;
  final String subjectId;
  const SubjectTabContent({
    super.key,
    required this.educationalGradeId,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TeachersBlocBuilder(
          educationalGradeId: educationalGradeId,
          subjectId: subjectId,
        ),
        const SizedBox(height: 16),
        const SubjectCourses(),
      ],
    );
  }
}
