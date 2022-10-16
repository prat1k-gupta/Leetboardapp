// To parse this JSON data, do
//
//     final contestModel = contestModelFromJson(jsonString);

import 'dart:convert';

ContestModel contestModelFromJson(String str) =>
    ContestModel.fromJson(json.decode(str));

String contestModelToJson(ContestModel data) => json.encode(data.toJson());

class ContestModel {
  ContestModel({
    this.meta,
    this.objects,
  });

  Meta? meta;
  List<Object>? objects;

  factory ContestModel.fromJson(Map<String, dynamic> json) => ContestModel(
        meta: Meta.fromJson(json["meta"]),
        objects:
            List<Object>.from(json["objects"].map((x) => Object.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "objects": List<dynamic>.from(objects!.map((x) => x.toJson())),
      };
}

class Meta {
  Meta({
    this.estimatedCount,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.totalCount,
  });

  int? estimatedCount;
  int? limit;
  String? next;
  int? offset;
  dynamic? previous;
  dynamic? totalCount;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        estimatedCount: json["estimated_count"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "estimated_count": estimatedCount,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total_count": totalCount,
      };
}

class Object {
  Object({
    this.duration,
    this.end,
    this.event,
    this.host,
    this.href,
    this.id,
    this.parsedAt,
    this.problems,
    this.resource,
    this.resourceId,
    this.start,
  });

  int? duration;
  DateTime? end;
  String? event;
  Host? host;
  String? href;
  int? id;
  DateTime? parsedAt;
  dynamic? problems;
  Host? resource;
  int? resourceId;
  DateTime? start;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        duration: json["duration"],
        end: DateTime.parse(json["end"]),
        event: json["event"],
        host: hostValues.map![json["host"]],
        href: json["href"],
        id: json["id"],
        parsedAt: json["parsed_at"] == null
            ? null
            : DateTime.parse(json["parsed_at"]),
        problems: json["problems"],
        resource: hostValues.map![json["resource"]],
        resourceId: json["resource_id"],
        start: DateTime.parse(json["start"]),
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "end": end?.toIso8601String(),
        "event": event,
        "host": hostValues.reverse![host],
        "href": href,
        "id": id,
        "parsed_at": parsedAt == null ? null : parsedAt?.toIso8601String(),
        "problems": problems,
        "resource": hostValues.reverse![resource],
        "resource_id": resourceId,
        "start": start?.toIso8601String(),
      };
}

enum Host { CODECHEF_COM, CODEFORCES_COM }

final hostValues = EnumValues(
    {"codechef.com": Host.CODECHEF_COM, "codeforces.com": Host.CODEFORCES_COM});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
