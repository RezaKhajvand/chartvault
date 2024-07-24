import 'dart:convert';

Workshop workshopFromJson(String str) => Workshop.fromJson(json.decode(str));

class Workshop {
  int currentPage;
  List<WorkShopRecord> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String? nextPageUrl;
  String path;
  int perPage;
  String? prevPageUrl;
  int to;
  int total;

  Workshop({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Workshop.fromJson(Map<String, dynamic> json) => Workshop(
        currentPage: json["current_page"],
        data: List<WorkShopRecord>.from(
            json["data"].map((x) => WorkShopRecord.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class WorkShopRecord {
  int id;
  String title;
  String thumbnailPath;
  String videoPath;
  String descriptions;
  String externalUrl;
  DateTime createdAt;

  WorkShopRecord({
    required this.id,
    required this.title,
    required this.thumbnailPath,
    required this.videoPath,
    required this.descriptions,
    required this.externalUrl,
    required this.createdAt,
  });

  factory WorkShopRecord.fromJson(Map<String, dynamic> json) => WorkShopRecord(
        id: json["id"],
        title: json["title"],
        thumbnailPath: json["thumbnail_path"],
        videoPath: json["video_path"] ?? '',
        descriptions: json["descriptions"] ?? '',
        externalUrl: json["external_url"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
      );
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}
