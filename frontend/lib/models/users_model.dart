// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.avatar,
    this.roomName,
    this.roomId,
    this.ownerId,
    this.users,
  });

  String? avatar;
  String? roomName;
  String? roomId;
  String? ownerId;
  List<User>? users;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        avatar: json["avatar"],
        roomName: json["roomName"],
        roomId: json["roomId"],
        ownerId: json["ownerId"],
        users: List<User>.from(
            json["users"].map((x) => x == null ? null : User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "roomName": roomName,
        "roomId": roomId,
        "ownerId": ownerId,
        "users": List<dynamic>.from(
            users!.map((x) => x == null ? null : x.toJson())),
      };
}

class User {
  User({
    this.data,
  });

  Data? data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.matchedUser,
    this.recentAcSubmissionList,
  });

  MatchedUser? matchedUser;
  List<RecentAcSubmissionList>? recentAcSubmissionList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        matchedUser: MatchedUser.fromJson(json["matchedUser"]),
        recentAcSubmissionList: List<RecentAcSubmissionList>.from(
            json["recentAcSubmissionList"]
                .map((x) => RecentAcSubmissionList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "matchedUser": matchedUser!.toJson(),
        "recentAcSubmissionList":
            List<dynamic>.from(recentAcSubmissionList!.map((x) => x.toJson())),
      };
}

class MatchedUser {
  MatchedUser({
    this.username,
    this.githubUrl,
    this.linkedinUrl,
    this.profile,
    this.languageProblemCount,
    this.userCalendar,
    this.submitStatsGlobal,
  });

  String? username;
  String? githubUrl;
  String? linkedinUrl;
  Profile? profile;
  List<LanguageProblemCount>? languageProblemCount;
  UserCalendar? userCalendar;
  SubmitStatsGlobal? submitStatsGlobal;

  factory MatchedUser.fromJson(Map<String, dynamic> json) => MatchedUser(
        username: json["username"],
        githubUrl: json["githubUrl"] == null ? null : json["githubUrl"],
        linkedinUrl: json["linkedinUrl"] == null ? null : json["linkedinUrl"],
        profile: Profile.fromJson(json["profile"]),
        languageProblemCount: List<LanguageProblemCount>.from(
            json["languageProblemCount"]
                .map((x) => LanguageProblemCount.fromJson(x))),
        userCalendar: UserCalendar.fromJson(json["userCalendar"]),
        submitStatsGlobal:
            SubmitStatsGlobal.fromJson(json["submitStatsGlobal"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "githubUrl": githubUrl == null ? null : githubUrl,
        "linkedinUrl": linkedinUrl == null ? null : linkedinUrl,
        "profile": profile!.toJson(),
        "languageProblemCount":
            List<dynamic>.from(languageProblemCount!.map((x) => x.toJson())),
        "userCalendar": userCalendar!.toJson(),
        "submitStatsGlobal": submitStatsGlobal!.toJson(),
      };
}

class LanguageProblemCount {
  LanguageProblemCount({
    this.languageName,
    this.problemsSolved,
  });

  String? languageName;
  int? problemsSolved;

  factory LanguageProblemCount.fromJson(Map<String, dynamic> json) =>
      LanguageProblemCount(
        languageName: json["languageName"],
        problemsSolved: json["problemsSolved"],
      );

  Map<String, dynamic> toJson() => {
        "languageName": languageName,
        "problemsSolved": problemsSolved,
      };
}

class Profile {
  Profile({
    this.ranking,
    this.userAvatar,
    this.realName,
    this.school,
  });

  int? ranking;
  String? userAvatar;
  String? realName;
  String? school;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        ranking: json["ranking"],
        userAvatar: json["userAvatar"],
        realName: json["realName"],
        school: json["school"] == null ? null : json["school"],
      );

  Map<String, dynamic> toJson() => {
        "ranking": ranking,
        "userAvatar": userAvatar,
        "realName": realName,
        "school": school == null ? null : school,
      };
}

class SubmitStatsGlobal {
  SubmitStatsGlobal({
    this.acSubmissionNum,
  });

  List<AcSubmissionNum>? acSubmissionNum;

  factory SubmitStatsGlobal.fromJson(Map<String, dynamic> json) =>
      SubmitStatsGlobal(
        acSubmissionNum: List<AcSubmissionNum>.from(
            json["acSubmissionNum"].map((x) => AcSubmissionNum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "acSubmissionNum":
            List<dynamic>.from(acSubmissionNum!.map((x) => x.toJson())),
      };
}

class AcSubmissionNum {
  AcSubmissionNum({
    this.difficulty,
    this.count,
  });

  String? difficulty;
  int? count;

  factory AcSubmissionNum.fromJson(Map<String, dynamic> json) =>
      AcSubmissionNum(
        difficulty: json["difficulty"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "difficulty": difficulty,
        "count": count,
      };
}

class UserCalendar {
  UserCalendar({
    this.streak,
    this.totalActiveDays,
  });

  int? streak;
  int? totalActiveDays;

  factory UserCalendar.fromJson(Map<String, dynamic> json) => UserCalendar(
        streak: json["streak"],
        totalActiveDays: json["totalActiveDays"],
      );

  Map<String, dynamic> toJson() => {
        "streak": streak,
        "totalActiveDays": totalActiveDays,
      };
}

class RecentAcSubmissionList {
  RecentAcSubmissionList({
    this.id,
    this.title,
    this.titleSlug,
    this.timestamp,
  });

  String? id;
  String? title;
  String? titleSlug;
  String? timestamp;

  factory RecentAcSubmissionList.fromJson(Map<String, dynamic> json) =>
      RecentAcSubmissionList(
        id: json["id"],
        title: json["title"],
        titleSlug: json["titleSlug"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "titleSlug": titleSlug,
        "timestamp": timestamp,
      };
}
