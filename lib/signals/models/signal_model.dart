import 'dart:convert';

SignalModel signalModelFromJson(String str) =>
    SignalModel.fromJson(json.decode(str));

class SignalModel {
  List<SignalRecord> data;
  Links links;
  Meta meta;

  SignalModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory SignalModel.fromJson(Map<String, dynamic> json) => SignalModel(
        data: List<SignalRecord>.from(
            json["data"].map((x) => SignalRecord.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );
}

class SignalRecord {
  int id;
  String risk;
  String entryZone;
  String stopLoss;
  DateTime createdAt;
  int statusCode;
  String status;
  Stock stock;
  List<TakeProfit> takeProfits;
  List<Update> updates;

  SignalRecord({
    required this.id,
    required this.risk,
    required this.entryZone,
    required this.stopLoss,
    required this.createdAt,
    required this.statusCode,
    required this.status,
    required this.stock,
    required this.takeProfits,
    required this.updates,
  });

  factory SignalRecord.fromJson(Map<String, dynamic> json) => SignalRecord(
      id: json["id"],
      risk: json["risk"],
      entryZone: json["entry_zone"],
      stopLoss: json["stop_loss"],
      createdAt: DateTime.parse(json["created_at"]),
      statusCode: json["status_code"],
      status: json["status"],
      stock: Stock.fromJson(json["stock"]),
      takeProfits: json["take_profits"] != null
          ? List<TakeProfit>.from(
              json["take_profits"].map((x) => TakeProfit.fromJson(x)))
          : [],
      updates: json["updates"] != null
          ? List<Update>.from(json["updates"].map((x) => Update.fromJson(x)))
          : []);
}

class Stock {
  String abbreviation;
  String logoPath;
  String name;

  Stock({
    required this.abbreviation,
    required this.logoPath,
    required this.name,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        abbreviation: json["abbreviation"],
        logoPath: json["logo_path"],
        name: json["name"],
      );
}

class TakeProfit {
  int id;
  String takeProfit;
  int statusCode;
  String status;

  TakeProfit({
    required this.id,
    required this.takeProfit,
    required this.statusCode,
    required this.status,
  });

  factory TakeProfit.fromJson(Map<String, dynamic> json) => TakeProfit(
        id: json["id"],
        takeProfit: json["take_profit"],
        statusCode: json["status_code"],
        status: json["status"],
      );
}

class Update {
  String text;
  DateTime createdAt;

  Update({
    required this.text,
    required this.createdAt,
  });

  factory Update.fromJson(Map<String, dynamic> json) => Update(
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
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
