import 'dart:convert';

import 'package:chartvault/const/values.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

class NewsModel {
  int currentPage;
  List<NewsRecord> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  NewsModel({
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

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        currentPage: json["current_page"],
        data: List<NewsRecord>.from(
            json["data"].map((x) => NewsRecord.fromJson(x))),
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

class NewsRecord {
  int id;
  String url;
  String image;
  String title;
  String content;
  dynamic externalUrl;
  DateTime createdAt;
  Writer writer;

  NewsRecord({
    required this.id,
    required this.url,
    required this.image,
    required this.title,
    required this.content,
    required this.externalUrl,
    required this.createdAt,
    required this.writer,
  });

  factory NewsRecord.fromJson(Map<String, dynamic> json) => NewsRecord(
        id: json["id"],
        url: json["url"],
        image: json["image"] ?? placeHolder,
        title: json["title"],
        content: json["content"],
        externalUrl: json["external_url"],
        createdAt: DateTime.parse(json["created_at"]),
        writer: Writer.fromJson(json["writer"]),
      );
}

class Writer {
  String name;

  Writer({required this.name});

  factory Writer.fromJson(Map<String, dynamic> json) =>
      Writer(name: json["name"]);
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
