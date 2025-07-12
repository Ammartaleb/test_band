class LoginApiRequestBody {
  final String phone;
  final String password;
  final String fcmToken;

  LoginApiRequestBody({
    required this.phone,
    required this.password,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
    "fcm_token": fcmToken,
  };
}

class SignupApiRequestBody {
  final String firstName;
  final String lastName;
  final int? educationalGradeId;
  final String password;
  final String rePassword;
  final String phone;
  final String gender;
  final String birthDate;
  final String? latitude;
  final String? longitude;
  final String? locationName;
  final int? governorateId;

  SignupApiRequestBody({
    required this.firstName,
    required this.lastName,
    this.educationalGradeId,
    required this.password,
    required this.rePassword,
    required this.phone,
    required this.gender,
    required this.birthDate,
    this.latitude,
    this.longitude,
    this.locationName,
    this.governorateId,
  });

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "educational_grade_id": educationalGradeId,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
        "gender": gender,
        "birth_date": birthDate,
        "latitude": latitude,
        "longitude": longitude,
        "locationName": locationName,
        "governorate_id": governorateId,
      };
}
