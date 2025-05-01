import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  int totalItems;
  int endIndex;
  int startIndex;
  int itemsPerPage;
  List<Item> items;

  NewsModel({
    this.totalItems = 0,
    this.endIndex = 0,
    this.startIndex = 0,
    this.itemsPerPage = 0,
    this.items = const [],
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        totalItems: json["totalItems"] ?? 0,
        endIndex: json["endIndex"] ?? 0,
        startIndex: json["startIndex"] ?? 0,
        itemsPerPage: json["itemsPerPage"] ?? 0,
        items: List<Item>.from(
          (json["items"] as List<dynamic>? ?? []).map(
            (x) => Item.fromJson(x as Map<String, dynamic>? ?? {}),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "endIndex": endIndex,
        "startIndex": startIndex,
        "itemsPerPage": itemsPerPage,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  List<dynamic> essay;
  String placeOfPublication;
  int startYear;
  String publisher;
  List<String> county;
  dynamic edition;
  String frequency;
  String url;
  String id;
  List<String> subject;
  List<String> city;
  List<String> language;
  String title;
  List<String> holdingType;
  int endYear;
  List<dynamic> altTitle;
  List<String> note;
  String lccn;
  List<String> state;
  List<String> place;
  String country;
  String type;
  String titleNormal;
  String oclc;

  Item({
    this.essay = const [],
    this.placeOfPublication = "",
    this.startYear = 0,
    this.publisher = "",
    this.county = const [],
    this.edition = '',
    this.frequency = "",
    this.url = "",
    this.id = "",
    this.subject = const [],
    this.city = const [],
    this.language = const [],
    this.title = "",
    this.holdingType = const [],
    this.endYear = 0,
    this.altTitle = const [],
    this.note = const [],
    this.lccn = "",
    this.state = const [],
    this.place = const [],
    this.country = "",
    this.type = "",
    this.titleNormal = "",
    this.oclc = "",
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        essay: List<dynamic>.from(json["essay"]?.map((x) => x) ?? []),
        placeOfPublication: json["place_of_publication"]?.toString() ?? "",
        startYear: json["start_year"] is int ? json["start_year"] : 0,
        publisher: json["publisher"]?.toString() ?? "",
        county: List<String>.from(
          (json["county"] as List<dynamic>? ?? []).map(
            (x) => x?.toString() ?? "",
          ),
        ),
        edition: json["edition"] ?? '',
        frequency: json["frequency"]?.toString() ?? "",
        url: json["url"]?.toString() ?? "",
        id: json["id"]?.toString() ?? "",
        subject: List<String>.from(
          (json["subject"] as List<dynamic>? ?? []).map(
            (x) => x?.toString() ?? "",
          ),
        ),
        city: List<String>.from(
          (json["city"] as List<dynamic>? ?? []).map(
            (x) => x?.toString() ?? "",
          ),
        ),
        language: List<String>.from(
          (json["language"] as List<dynamic>? ?? []).map(
            (x) => x?.toString() ?? "",
          ),
        ),
        title: json["title"]?.toString() ?? "",
        holdingType: List<String>.from(
          (json["holding_type"] as List<dynamic>? ?? []).map(
            (x) => x?.toString() ?? "",
          ),
        ),
        endYear: json["end_year"] is int ? json["end_year"] : 0,
        altTitle: List<dynamic>.from(json["alt_title"]?.map((x) => x) ?? []),
        note: List<String>.from(
          (json["note"] as List<dynamic>? ?? []).map(
            (x) => x?.toString() ?? "",
          ),
        ),
        lccn: json["lccn"]?.toString() ?? "",
        state: List<String>.from(
          (json["state"] as List<dynamic>? ?? []).map(
            (x) => x?.toString() ?? "",
          ),
        ),
        place: List<String>.from(
          (json["place"] as List<dynamic>? ?? []).map(
            (x) => x?.toString() ?? "",
          ),
        ),
        country: json["country"]?.toString() ?? "",
        type: json["type"]?.toString() ?? "",
        titleNormal: json["title_normal"]?.toString() ?? "",
        oclc: json["oclc"]?.toString() ?? "",
      );

  Map<String, dynamic> toJson() => {
        "essay": List<dynamic>.from(essay.map((x) => x)),
        "place_of_publication": placeOfPublication,
        "start_year": startYear,
        "publisher": publisher,
        "county": List<dynamic>.from(county.map((x) => x)),
        "edition": edition,
        "frequency": frequency,
        "url": url,
        "id": id,
        "subject": List<dynamic>.from(subject.map((x) => x)),
        "city": List<dynamic>.from(city.map((x) => x)),
        "language": List<dynamic>.from(language.map((x) => x)),
        "title": title,
        "holding_type": List<dynamic>.from(holdingType.map((x) => x)),
        "end_year": endYear,
        "alt_title": List<dynamic>.from(altTitle.map((x) => x)),
        "note": List<dynamic>.from(note.map((x) => x)),
        "lccn": lccn,
        "state": List<dynamic>.from(state.map((x) => x)),
        "place": List<dynamic>.from(place.map((x) => x)),
        "country": country,
        "type": type,
        "title_normal": titleNormal,
        "oclc": oclc,
      };
}
