class MobileDataPlanModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorCardId;

  MobileDataPlanModel({
    this.id,
    this.name,
    this.price,
    this.operatorCardId,
  });

  factory MobileDataPlanModel.fromJson(Map<String, dynamic> json) =>
      MobileDataPlanModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        operatorCardId: json['operator_card_id'],
      );
}
