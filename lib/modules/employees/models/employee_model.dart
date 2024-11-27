import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel {
  final dynamic id;
  final String name;
  final String job;

  @JsonKey(name: 'admission_date')
  final String admissionDate;

  final String phone;
  final String image;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: int.tryParse(json['id'].toString()) ?? json['id'],
      name: json['name'] as String,
      job: json['job'] as String,
      admissionDate: json['admission_date'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}
