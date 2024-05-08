class TipModel {
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnail;

  TipModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnail,
  });

  factory TipModel.fromJson(Map<String, dynamic> json) => TipModel(
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnail: json['thumbnail'],
      );
}
