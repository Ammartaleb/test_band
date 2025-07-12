import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_band/core/helpers/app_assets.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/features/home/domain/entities/teacher_response_entity.dart';

class SubjectTeachersWidget extends StatelessWidget {
  final List<TeacherEntity> teachers;
  const SubjectTeachersWidget({super.key, required this.teachers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppConsts.teachers.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.only(end: 16),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: SubjectTeachersListItemWidget(
            teacher: teachers[index],
          ),
        ),
      ),
    );
  }
}

class SubjectTeachersListItemWidget extends StatelessWidget {
  final TeacherEntity teacher;
  const SubjectTeachersListItemWidget({super.key, required this.teacher});

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
          teacher.name,
          style: AppTextStyles.bold.toTextStyle().copyWith(
            fontSize: 10,
            color: AppColors.kPrimaryText,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          teacher.phoneNumber,
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
