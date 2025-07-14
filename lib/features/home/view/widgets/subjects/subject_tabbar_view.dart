import 'package:flutter/material.dart';
import 'package:test_band/features/home/model/subject_response_model.dart';
import 'package:test_band/features/home/view/widgets/subjects/subject_tab_content.dart';

class SubjectsTabBarView extends StatelessWidget {
  final TabController? tabController;
  final List<SubjectModel> subjects;
  final String educationalGradeId;
  const SubjectsTabBarView({
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
          return SubjectTabContent(
            educationalGradeId: educationalGradeId,
            subjectId: subject.id.toString(),
          );
        }).toList(),
      ),
    );
  }
}
