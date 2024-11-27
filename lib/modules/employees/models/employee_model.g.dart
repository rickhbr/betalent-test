// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      id: json['id'],
      name: json['name'] as String,
      job: json['job'] as String,
      admissionDate: json['admission_date'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'job': instance.job,
      'admission_date': instance.admissionDate,
      'phone': instance.phone,
      'image': instance.image,
    };
