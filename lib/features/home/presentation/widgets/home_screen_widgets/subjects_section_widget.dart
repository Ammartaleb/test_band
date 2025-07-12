import 'package:flutter/material.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/subjects_tabbar_widget.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/subjects_tabs_widget.dart';

class SubjectsSectionWidget extends StatefulWidget {
  final List<SubjectEntity> subjects;
  final String educationalGradeId;
  const SubjectsSectionWidget({
    super.key,
    required this.subjects,
    required this.educationalGradeId,
  });

  @override
  _SubjectsSectionWidgetState createState() => _SubjectsSectionWidgetState();
}

class _SubjectsSectionWidgetState extends State<SubjectsSectionWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  List<SubjectEntity> _subjects = [];

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
        SubjectsTabBarWidget(
          tabController: _tabController,
          currentIndex: _currentIndex,
          onTapFunction: (index) => _changeTabIndex(index),
          subjects: _subjects,
        ),
        const SizedBox(height: 24),
        SubjectsTabsWidget(
          tabController: _tabController,
          subjects: _subjects,
          educationalGradeId: widget.educationalGradeId,
        ),
      ],
    );
  }
}
