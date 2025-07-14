import 'package:flutter/material.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/core/theming/app_colors.dart';
import 'package:test_band/core/theming/text_styles.dart';
import 'package:test_band/core/utils/app_extensions.dart';
import 'package:test_band/core/widgets/base_button_widget.dart';

class SubjectCourses extends StatelessWidget {
  const SubjectCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'الدروس المجانية',
              style: AppTextStyles.bold.toTextStyle().copyWith(
                fontSize: 18,
                color: AppColors.kPrimaryText,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 170,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: AppConsts.lessons.length,
            padding: const EdgeInsetsDirectional.only(end: 16),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(start: 9),
              child: SubjectCoursesListItem(
                lesson: AppConsts.lessons[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SubjectCoursesListItem extends StatelessWidget {
  final Map<String, String> lesson;
  const SubjectCoursesListItem({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
      child: Column(
        children: [
          SizedBox(
            width: context.width(),
            height: 106,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
                  child: Image.network(
                    AppConsts.dummyCourseImage,
                    fit: BoxFit.cover,
                    width: context.width(),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(13),
                    ),
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.kPrimary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(13)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lesson['teacher']!,
                      style: AppTextStyles.regular.toTextStyle().copyWith(
                        color: AppColors.kWhite,
                        fontSize: 9,
                      ),
                    ),
                    BaseButtonWidget(
                      width: 100,
                      height: 20,
                      borderRadius: 5,
                      onPressFunction: () {},
                      btnText: "متابعه الاستاذ",
                      btnFontSize: 8,
                      btnColor: AppColors.kWhite,
                      btnTextColor: AppColors.kPrimary,
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Text(
                  lesson['topics']!,
                  style: AppTextStyles.regular.toTextStyle().copyWith(
                    color: AppColors.kWhite,
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
