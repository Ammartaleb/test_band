import 'package:test_band/features/auth/domain/entities/grade_entity.dart';
import 'package:test_band/features/auth/domain/entities/gender_entity.dart';
import 'package:test_band/features/auth/domain/entities/governorate_entity.dart';
import 'package:test_band/features/home/domain/entities/banner_response_entity.dart';
import 'package:test_band/features/home/domain/entities/subject_response_entity.dart';
import 'package:test_band/features/home/domain/entities/teacher_response_entity.dart';

class AppConsts {
  /// [FakeData]
  static List<GenderEntity> genders = [
    GenderEntity(key: "male", value: "ذكر"),
    GenderEntity(key: "female", value: "انثى"),
  ];
  static List<GradeEntity> educationalGrades = [
    GradeEntity(id: 0, title: "تاسع"),
    GradeEntity(id: 1, title: "بكالوريا"),
  ];
  static List<GovernorateEntity> governorates = [
    GovernorateEntity(id: 1, title: "دمشق"),
    GovernorateEntity(id: 2, title: "بكالوريا"),
  ];
  static List<BannerEntity> banners = [
    BannerEntity(
      id: 1,
      title: "Class Room 1",
      imageUrl:
          "https://cdn.pixabay.com/photo/2024/11/21/16/18/ai-generated-9214142_1280.jpg",
    ),
    BannerEntity(
      id: 2,
      title: "Class Room 2",
      imageUrl:
          "https://cdn.pixabay.com/photo/2024/09/12/21/20/ai-generated-9043372_1280.png",
    ),
    BannerEntity(
      id: 3,
      title: "Class Room 3",
      imageUrl:
          "https://cdn.pixabay.com/photo/2024/09/09/07/21/ai-generated-9034001_1280.jpg",
    ),
    BannerEntity(
      id: 4,
      title: "Class Room 4",
      imageUrl:
          "https://cdn.pixabay.com/photo/2024/04/25/07/41/ai-generated-8719217_1280.jpg",
    ),
  ];
  static List<SubjectEntity> subjects = [
    SubjectEntity(id: 1, name: "البرمجة"),
    SubjectEntity(id: 2, name: "سي بلس بلس"),
    SubjectEntity(id: 3, name: "فلاتر"),
    SubjectEntity(id: 4, name: "نود جي إس"),
    SubjectEntity(id: 5, name: "بي إتش بي"),
  ];

  static List<TeacherEntity> teachers = [
    TeacherEntity(
      id: 1,
      name: "محمد علي",
      email: 'teacher1@gmail.com',
      phoneNumber: '+9647509001900',
    ),
    TeacherEntity(
      id: 2,
      name: "أحمد حسن",
      email: 'teacher2@gmail.com',
      phoneNumber: '+9647509001910',
    ),
    TeacherEntity(
      id: 3,
      name: "عمار طالب",
      email: 'teacher3@gmail.com',
      phoneNumber: '+9647509001920',
    ),
    TeacherEntity(
      id: 4,
      name: "عمر طالب",
      email: 'teacher4@gmail.com',
      phoneNumber: '+9647509001930',
    ),
    TeacherEntity(
      id: 5,
      name: "سامي طالب",
      email: 'teacher5@gmail.com',
      phoneNumber: '+9647509001940',
    ),
    TeacherEntity(
      id: 6,
      name: "عبد القادر طالب",
      email: 'teacher6@gmail.com',
      phoneNumber: '+9647509001950',
    ),
    TeacherEntity(
      id: 7,
      name: "خالد طالب",
      email: 'teacher7@gmail.com',
      phoneNumber: '+9647509001960',
    ),
  ];

  static List<Map<String, String>> lessons = [
    {'teacher': 'أ / طارق كرم بدر', 'topics': 'الإعراب، النحو، الصرف، الإملاء'},
    {'teacher': 'أ / طارق كرم بدر', 'topics': 'الإعراب، النحو، الصرف، الإملاء'},
    {'teacher': 'أ / طارق كرم بدر', 'topics': 'الإعراب، النحو، الصرف، الإملاء'},
  ];

  static const String dummyCourseImage =
      "https://cdn.pixabay.com/photo/2024/05/21/19/58/code-8779051_1280.jpg";
}
