import 'package:bank_sha/models/mobile-data-plan_model.dart';

class MobileOperatorModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<MobileDataPlanModel>? dataPlan;

  MobileOperatorModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataPlan,
  });

  factory MobileOperatorModel.fromJson(Map<String, dynamic> json) =>
      MobileOperatorModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        thumbnail: json['thumbnail'],
        dataPlan: json['data_plans'] == null
            ? null
            : (json['data_plans'] as List)
                .map((dataPlan) => MobileDataPlanModel.fromJson(dataPlan))
                .toList(),
      );
}
