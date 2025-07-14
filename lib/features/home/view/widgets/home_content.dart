import 'package:flutter/material.dart';
import 'package:test_band/features/home/model/educational_grade_response_model.dart';
import 'package:test_band/features/home/view/widgets/home_banners_bloc_builder.dart';
import 'package:test_band/features/home/view/widgets/home_subjects_bloc_builder.dart';

class HomeContent extends StatefulWidget {
  final List<EducationalGradeModel> educationalGrades;
  const HomeContent({super.key, required this.educationalGrades});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  EducationalGradeModel? _educationalGrade;
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
                  HomeBannersBlocBuilder(),
                  SizedBox(height: 42),
                ],
              ),
            ),
          ];
        },
        body: HomeSubjectsBlocBuilder(
          educationalGradeId: _educationalGrade?.id.toString() ?? "0",
        ),
      ),
    );
  }
}
