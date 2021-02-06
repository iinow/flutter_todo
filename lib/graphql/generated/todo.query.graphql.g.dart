// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDiary$Query$Diary _$GetDiary$Query$DiaryFromJson(Map<String, dynamic> json) {
  return GetDiary$Query$Diary()
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..content = json['content'] as String
    ..updatedAt = json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String)
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String);
}

Map<String, dynamic> _$GetDiary$Query$DiaryToJson(
        GetDiary$Query$Diary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

GetDiary$Query _$GetDiary$QueryFromJson(Map<String, dynamic> json) {
  return GetDiary$Query()
    ..diaryById = json['diaryById'] == null
        ? null
        : GetDiary$Query$Diary.fromJson(
            json['diaryById'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetDiary$QueryToJson(GetDiary$Query instance) =>
    <String, dynamic>{
      'diaryById': instance.diaryById?.toJson(),
    };

GetDiaryArguments _$GetDiaryArgumentsFromJson(Map<String, dynamic> json) {
  return GetDiaryArguments(
    diaryId: json['diaryId'] as int,
  );
}

Map<String, dynamic> _$GetDiaryArgumentsToJson(GetDiaryArguments instance) =>
    <String, dynamic>{
      'diaryId': instance.diaryId,
    };
