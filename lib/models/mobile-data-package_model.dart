class MobileDataPackageModel {
  final int? id;
  final String? phoneNumber;
  final String? pin;

  MobileDataPackageModel({
    required this.id,
    required this.phoneNumber,
    required this.pin,
  });

  Map<String, dynamic> toJson() => {
        'data_plan_id': id.toString(),
        'phone_number': phoneNumber,
        'pin': pin,
      };
}
