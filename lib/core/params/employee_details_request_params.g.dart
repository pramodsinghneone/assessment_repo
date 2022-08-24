// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_details_request_params.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeDetailsParamsAdapter extends TypeAdapter<EmployeeDetailsParams> {
  @override
  final int typeId = 1;

  @override
  EmployeeDetailsParams read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeDetailsParams(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      gender: fields[2] as String?,
      phoneNumber: fields[3] as String?,
      emailId: fields[4] as String?,
      dob: fields[5] as String?,
      postGraduation: fields[6] as String?,
      postGraduationPercentage: fields[7] as String?,
      graduation: fields[8] as String?,
      graduationPercentage: fields[9] as String?,
      hsc: fields[10] as String?,
      hscPercentage: fields[11] as String?,
      ssc: fields[12] as String?,
      sscPercentage: fields[13] as String?,
      locationWorkPeref: fields[14] as String?,
      shift: fields[15] as String?,
      typeOfEmployement: fields[16] as String?,
      availableOnWeekends: fields[17] as bool?,
      createdOn: fields[18] as DateTime?,
      updatedOn: fields[19] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeDetailsParams obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.emailId)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.postGraduation)
      ..writeByte(7)
      ..write(obj.postGraduationPercentage)
      ..writeByte(8)
      ..write(obj.graduation)
      ..writeByte(9)
      ..write(obj.graduationPercentage)
      ..writeByte(10)
      ..write(obj.hsc)
      ..writeByte(11)
      ..write(obj.hscPercentage)
      ..writeByte(12)
      ..write(obj.ssc)
      ..writeByte(13)
      ..write(obj.sscPercentage)
      ..writeByte(14)
      ..write(obj.locationWorkPeref)
      ..writeByte(15)
      ..write(obj.shift)
      ..writeByte(16)
      ..write(obj.typeOfEmployement)
      ..writeByte(17)
      ..write(obj.availableOnWeekends)
      ..writeByte(18)
      ..write(obj.createdOn)
      ..writeByte(19)
      ..write(obj.updatedOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeDetailsParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
