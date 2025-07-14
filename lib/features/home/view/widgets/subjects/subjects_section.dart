import 'package:flutter/material.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/features/home/model/subject_response_model.dart';
import 'package:test_band/features/home/view/widgets/subjects/subjects_tabbar.dart';
import 'package:test_band/features/home/view/widgets/subjects/subject_tabbar_view.dart';

class SubjectsSection extends StatefulWidget {
  final List<SubjectModel> subjects;
  final String educationalGradeId;
  const SubjectsSection({
    super.key,
    required this.subjects,
    required this.educationalGradeId,
  });

  @override
  _SubjectsSectionState createState() => _SubjectsSectionState();
}

class _SubjectsSectionState extends State<SubjectsSection>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  List<SubjectModel> _subjects = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _subjects = widget.subjects;
    _subjects = AppConsts.subjects;
    _tabController = TabController(
      length: AppConsts.subjects.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _changeTabIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubjectsTabBar(
          tabController: _tabController,
          currentIndex: _currentIndex,
          onTapFunction: (index) => _changeTabIndex(index),
          subjects: _subjects,
        ),
        const SizedBox(height: 24),
        SubjectsTabBarView(
          tabController: _tabController,
          subjects: _subjects,
          educationalGradeId: widget.educationalGradeId,
        ),
      ],
    );
  }
}
