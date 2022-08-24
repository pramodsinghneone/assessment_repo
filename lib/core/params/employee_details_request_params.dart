import 'package:hive/hive.dart';
part 'employee_details_request_params.g.dart';

@HiveType(typeId: 1)
class EmployeeDetailsParams {
  @HiveField(0)
  final String? firstName;
  @HiveField(1)
  final String? lastName;
  @HiveField(2)
  final String? gender;
  @HiveField(3)
  final String? phoneNumber;
  @HiveField(4)
  final String? emailId;
  @HiveField(5)
  final String? dob;
  @HiveField(6)
  final String? postGraduation;
  @HiveField(7)
  final String? postGraduationPercentage;
  @HiveField(8)
  final String? graduation;
  @HiveField(9)
  final String? graduationPercentage;
  @HiveField(10)
  final String? hsc;
  @HiveField(11)
  final String? hscPercentage;
  @HiveField(12)
  final String? ssc;
  @HiveField(13)
  final String? sscPercentage;
  @HiveField(14)
  final String? locationWorkPeref;
  @HiveField(15)
  final String? shift;
  @HiveField(16)
  final String? typeOfEmployement;
  @HiveField(17)
  final bool? availableOnWeekends;
  @HiveField(18)
  final DateTime? createdOn;
  @HiveField(19)
  final DateTime? updatedOn;
  EmployeeDetailsParams({
    this.firstName,
    this.lastName,
    this.gender,
    this.phoneNumber,
    this.emailId,
    this.dob,
    this.postGraduation,
    this.postGraduationPercentage,
    this.graduation,
    this.graduationPercentage,
    this.hsc,
    this.hscPercentage,
    this.ssc,
    this.sscPercentage,
    this.locationWorkPeref,
    this.shift,
    this.typeOfEmployement,
    this.availableOnWeekends,
    this.createdOn,
    this.updatedOn,
  });
}
