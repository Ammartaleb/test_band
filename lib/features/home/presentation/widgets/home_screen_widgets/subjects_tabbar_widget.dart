import 'package:flutter/material.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';

class SubjectsTabBarWidget extends StatelessWidget {
  final TabController? tabController;
  final int currentIndex;
  final Function(int) onTapFunction;
  final List<SubjectEntity> subjects;

  const SubjectsTabBarWidget({
    super.key,
    this.tabController,
    required this.currentIndex,
    required this.onTapFunction,
    required this.subjects,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: context.width(),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.kTabBar.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          labelPadding: EdgeInsets.zero,
          indicator: const BoxDecoration(),
          labelColor: AppColors.kWhite,
          dividerColor: AppColors.kTransparent,
          onTap: onTapFunction,
          unselectedLabelColor: AppColors.kPrimaryText,
          labelStyle: AppTextStyles.regular.toTextStyle().copyWith(
            fontSize: 10,
          ),
          unselectedLabelStyle: AppTextStyles.regular.toTextStyle().copyWith(
            fontSize: 10,
          ),
          tabs: subjects
              .map(
                (subject) => SubjectTabBarItemWidget(
                  isSelected: currentIndex == subjects.indexOf(subject),
                  subject: subject,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class SubjectTabBarItemWidget extends StatelessWidget {
  final bool isSelected;
  final SubjectEntity subject;
  const SubjectTabBarItemWidget({
    super.key,
    required this.isSelected,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.5),
          color: isSelected ? AppColors.kPrimary : AppColors.kTransparent,
        ),
        child: Text(subject.name),
      ),
    );
  }
}
