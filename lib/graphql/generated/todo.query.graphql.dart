// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'todo.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetDiary$Query$Diary with EquatableMixin {
  GetDiary$Query$Diary();

  factory GetDiary$Query$Diary.fromJson(Map<String, dynamic> json) =>
      _$GetDiary$Query$DiaryFromJson(json);

  int id;

  String title;

  String content;

  DateTime updatedAt;

  DateTime createdAt;

  @override
  List<Object> get props => [id, title, content, updatedAt, createdAt];
  Map<String, dynamic> toJson() => _$GetDiary$Query$DiaryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDiary$Query with EquatableMixin {
  GetDiary$Query();

  factory GetDiary$Query.fromJson(Map<String, dynamic> json) =>
      _$GetDiary$QueryFromJson(json);

  GetDiary$Query$Diary diaryById;

  @override
  List<Object> get props => [diaryById];
  Map<String, dynamic> toJson() => _$GetDiary$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDiaryArguments extends JsonSerializable with EquatableMixin {
  GetDiaryArguments({@required this.diaryId});

  @override
  factory GetDiaryArguments.fromJson(Map<String, dynamic> json) =>
      _$GetDiaryArgumentsFromJson(json);

  final int diaryId;

  @override
  List<Object> get props => [diaryId];
  @override
  Map<String, dynamic> toJson() => _$GetDiaryArgumentsToJson(this);
}

class GetDiaryQuery extends GraphQLQuery<GetDiary$Query, GetDiaryArguments> {
  GetDiaryQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetDiary'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'diaryId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'diaryById'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'diaryId')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'updatedAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GetDiary';

  @override
  final GetDiaryArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetDiary$Query parse(Map<String, dynamic> json) =>
      GetDiary$Query.fromJson(json);
}
