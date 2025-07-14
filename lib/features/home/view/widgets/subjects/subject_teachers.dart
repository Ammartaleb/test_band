import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/features/home/model/teacher_response_model.dart';

class SubjectTeachers extends StatefulWidget {
  final List<TeacherModel> teachers;
  const SubjectTeachers({super.key, required this.teachers});

  @override
  State<SubjectTeachers> createState() => _SubjectTeachersState();
}

class _SubjectTeachersState extends State<SubjectTeachers> {
  List<TeacherModel> _teachers = [];
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    _teachers = widget.teachers;
    _teachers = AppConsts.teachers;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _teachers.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.only(end: 16),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: SubjectTeachersListItem(teacher: _teachers[index]),
        ),
      ),
    );
  }
}

class SubjectTeachersListItem extends StatelessWidget {
  final TeacherModel teacher;
  const SubjectTeachersListItem({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: AppColors.kPrimary,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(AppIcons.iconUser, color: AppColors.kWhite),
        ),
        const SizedBox(height: 8),
        Text(
          teacher.name ?? "John Doe",
          style: AppTextStyles.bold.toTextStyle().copyWith(
            fontSize: 10,
            color: AppColors.kPrimaryText,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          teacher.phoneNumber ?? "+9647509001700",
          textDirection: TextDirection.ltr,
          style: AppTextStyles.regular.toTextStyle().copyWith(
            fontSize: 8,
            color: AppColors.kPrimaryText,
          ),
        ),
      ],
    );
  }
}
