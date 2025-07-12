import 'package:flutter/material.dart';
import 'package:test_band/features/home/domain/entities/educational_grade_response_entity.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/home_screen_banners_bloc_builder_widget.dart';
import 'package:test_band/features/home/presentation/widgets/home_screen_widgets/home_screen_subjects_bloc_builder_widget.dart';

class HomeScreenContentWidget extends StatefulWidget {
  final List<EducationalGradeEntity> educationalGrades;
  const HomeScreenContentWidget({super.key, required this.educationalGrades});

  @override
  State<HomeScreenContentWidget> createState() =>
      _HomeScreenContentWidgetState();
}

class _HomeScreenContentWidgetState extends State<HomeScreenContentWidget> {
  EducationalGradeEntity? _educationalGrade;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  _init() {
    _educationalGrade = widget.educationalGrades[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeScreenBannersBlocBuilderWidget(),
                  SizedBox(height: 42),
                ],
              ),
            ),
          ];
        },
        body: HomeScreenSubjectsBlocBuilderWidget(
          educationalGradeId: _educationalGrade?.id.toString() ?? "0",
        ),
      ),
    );
  }
}
