class MovieVideoDetail {
  final String name;
  final String key;
  final int size;
  final bool official;
  final DateTime publishedAt;
  final String id;

  MovieVideoDetail({
    required this.name,
    required this.key,
    required this.size,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory MovieVideoDetail.fromJson(Map<String, dynamic> json) =>
      MovieVideoDetail(
        name: json["name"],
        key: json["key"],
        size: json["size"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
        "size": size,
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
      };
}
