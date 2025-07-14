import 'package:test_band/features/home/model/banner_response_model.dart';
import 'package:test_band/features/home/model/subject_response_model.dart';
import 'package:test_band/features/home/model/teacher_response_model.dart';
import 'package:test_band/features/signup/model/gender_model.dart';
import 'package:test_band/features/signup/model/governorate_model.dart';
import 'package:test_band/features/signup/model/grade_model.dart';

class AppConsts {
  /// [Keys]
  static const String authTokenKey = "auth_token";

  /// [FakeData]
  static List<GenderModel> genders = [
    GenderModel(key: "male", value: "ذكر"),
    GenderModel(key: "female", value: "انثى"),
  ];
  static List<GradeModel> educationalGrades = [
    GradeModel(id: 0, title: "تاسع"),
    GradeModel(id: 1, title: "بكالوريا"),
  ];
  static List<GovernorateModel> governorates = [
    GovernorateModel(id: 1, title: "دمشق"),
    GovernorateModel(id: 2, title: "بكالوريا"),
  ];
  static List<BannerModel> banners = [
    BannerModel(
      id: 1,
      title: "Class Room 1",
      imageUrl:
          "https://cdn.pixabay.com/photo/2024/11/21/16/18/ai-generated-9214142_1280.jpg",
    ),
    BannerModel(
      id: 2,
      title: "Class Room 2",
      imageUrl:
          "https://cdn.pixabay.com/photo/2024/09/12/21/20/ai-generated-9043372_1280.png",
    ),
    BannerModel(
      id: 3,
      title: "Class Room 3",
      imageUrl:
          "https://cdn.pixabay.com/photo/2024/09/09/07/21/ai-generated-9034001_1280.jpg",
    ),
    BannerModel(
      id: 4,
      title: "Class Room 4",
      imageUrl:
          "https://cdn.pixabay.com/photo/2024/04/25/07/41/ai-generated-8719217_1280.jpg",
    ),
  ];
  static List<SubjectModel> subjects = [
    SubjectModel(id: 1, name: "البرمجة"),
    SubjectModel(id: 2, name: "سي بلس بلس"),
    SubjectModel(id: 3, name: "فلاتر"),
    SubjectModel(id: 4, name: "نود جي إس"),
    SubjectModel(id: 5, name: "بي إتش بي"),
  ];

  static List<TeacherModel> teachers = [
    TeacherModel(
      id: 1,
      name: "محمد علي",
      email: 'teacher1@gmail.com',
      phoneNumber: '+9647509001900',
    ),
    TeacherModel(
      id: 2,
      name: "أحمد حسن",
      email: 'teacher2@gmail.com',
      phoneNumber: '+9647509001910',
    ),
    TeacherModel(
      id: 3,
      name: "عمار طالب",
      email: 'teacher3@gmail.com',
      phoneNumber: '+9647509001920',
    ),
    TeacherModel(
      id: 4,
      name: "عمر طالب",
      email: 'teacher4@gmail.com',
      phoneNumber: '+9647509001930',
    ),
    TeacherModel(
      id: 5,
      name: "سامي طالب",
      email: 'teacher5@gmail.com',
      phoneNumber: '+9647509001940',
    ),
    TeacherModel(
      id: 6,
      name: "عبد القادر طالب",
      email: 'teacher6@gmail.com',
      phoneNumber: '+9647509001950',
    ),
    TeacherModel(
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
