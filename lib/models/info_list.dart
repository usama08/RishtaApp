class UserInfoData {
  final int step;
  final String aboutYourSelf;
  final String bodyType;
  final String caste;
  final String city;
  final String country;
  final String countryCode;
  final String dateOfBirth;
  final String designation;
  final String drinking;
  final String email;
  final String firstname;
  final String gender;
  final String gothra;
  final String habits;
  final String height;
  final String hobby;
  final String horoscope;
  final String income;
  final String lastname;
  final String manglik;
  final String maritalStatus;
  final String moonSign;
  final String motherTongue;
  final String occupation;
  final String phoneNo;
  final String qualification;
  final String religion;
  final String skinTone;
  final String smoking;
  final String star;
  final String state;
  final String statusChildren;
  final String subCaste;
  final String totalChildren;
  final String weight;
  final String imagePath;
  final String userId;

  UserInfoData({
    required this.step,
    required this.aboutYourSelf,
    required this.bodyType,
    required this.caste,
    required this.city,
    required this.country,
    required this.countryCode,
    required this.dateOfBirth,
    required this.designation,
    required this.drinking,
    required this.email,
    required this.firstname,
    required this.gender,
    required this.gothra,
    required this.habits,
    required this.height,
    required this.hobby,
    required this.horoscope,
    required this.income,
    required this.lastname,
    required this.manglik,
    required this.maritalStatus,
    required this.moonSign,
    required this.motherTongue,
    required this.occupation,
    required this.phoneNo,
    required this.qualification,
    required this.religion,
    required this.skinTone,
    required this.smoking,
    required this.star,
    required this.state,
    required this.statusChildren,
    required this.subCaste,
    required this.totalChildren,
    required this.weight,
    required this.imagePath,
    required this.userId,
  });

  factory UserInfoData.fromMap(Map<String, dynamic> json) {
    return UserInfoData(
      step: json["step"] ?? 0,
      aboutYourSelf: json['AboutYourSelf'] ?? "",
      bodyType: json['BodyType'] ?? "",
      caste: json['Caste'] ?? "",
      city: json['City'] ?? "",
      country: json['Country'] ?? "",
      countryCode: json['CountryCode'] ?? "",
      dateOfBirth: json['DateofBirth'] ?? "",
      designation: json['Designation'] ?? "",
      drinking: json['Drinking'] ?? "",
      email: json['Email'] ?? "",
      firstname: json['Firstname'] ?? "",
      gender: json['Gender'] ?? "",
      gothra: json['Gothra'] ?? "",
      habits: json['Habits'] ?? "",
      height: json['Height'] ?? "",
      hobby: json['Hobby'] ?? "",
      horoscope: json['Horoscope'] ?? "",
      income: json['Income'] ?? "",
      lastname: json['Lastname'] ?? "",
      manglik: json['Manglik'] ?? "",
      maritalStatus: json['MaritialStatus'] ?? "",
      moonSign: json['MoonSign'] ?? "",
      motherTongue: json['MotherTongue'] ?? "",
      occupation: json['Occupation'] ?? "",
      phoneNo: json['Phoneno'] ?? "",
      qualification: json['Qualification'] ?? "",
      religion: json['Religion'] ?? "",
      skinTone: json['SkinTone'] ?? "",
      smoking: json['Smoking'] ?? "",
      star: json['Star'] ?? "",
      state: json['State'] ?? "",
      statusChildren: json['StatusChildren'] ?? "",
      subCaste: json['SubCaste'] ?? "",
      totalChildren: json['TotalChildren'] ?? "",
      weight: json['Weight'] ?? "",
      imagePath: json['imagepath'] ?? "",
      userId: json['userId'] ?? "",
    );
  }
}

////////////////------------------//////////////
class CurrentUser {
  // Define the fields in your UserInfoData class
  final String userId;
  final String country;
  final String occupation;
  final String caste;
  final String gender;

  CurrentUser({
    required this.userId,
    required this.country,
    required this.occupation,
    required this.caste,
    required this.gender,
  });

  factory CurrentUser.fromMap(Map<String, dynamic> data) {
    return CurrentUser(
      userId: data['userId'] ?? '',
      country: data['Country'] ?? '',
      occupation: data['Occupation'] ?? "",
      caste: data['Caste'] ?? "",
      gender: data['Gender'] ?? "",
    );
  }
}
