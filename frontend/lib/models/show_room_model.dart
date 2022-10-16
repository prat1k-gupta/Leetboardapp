// To parse this JSON data, do
//
//     final showRoomModel = showRoomModelFromJson(jsonString);

import 'dart:convert';

ShowRoomModel showRoomModelFromJson(String str) =>
    ShowRoomModel.fromJson(json.decode(str));

String showRoomModelToJson(ShowRoomModel data) => json.encode(data.toJson());

class ShowRoomModel {
  ShowRoomModel({
    this.id,
    this.userName,
    this.roomIds,
    this.v,
  });

  String? id;
  String? userName;
  List<RoomId>? roomIds;
  int? v;

  factory ShowRoomModel.fromJson(Map<String, dynamic> json) => ShowRoomModel(
        id: json["_id"],
        userName: json["userName"],
        roomIds:
            List<RoomId>.from(json["roomIds"].map((x) => RoomId.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userName": userName,
        "roomIds": List<dynamic>.from(roomIds!.map((x) => x.toJson())),
        "__v": v,
      };
}

class RoomId {
  RoomId({
    this.roomName,
    this.roomId,
    this.id,
  });

  String? roomName;
  String? roomId;
  String? id;

  factory RoomId.fromJson(Map<String, dynamic> json) => RoomId(
        roomName: json["roomName"],
        roomId: json["roomId"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "roomName": roomName,
        "roomId": roomId,
        "_id": id,
      };
}
