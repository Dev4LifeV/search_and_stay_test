// ignore_for_file: non_constant_identifier_names

import 'package:search_and_stay_test/core/model/house_rule.dart';

class HouseRules {
  HouseRules({
    bool? success,
    String? message,
    Data? data,
  })  : _success = success,
        _message = message,
        _data = data;

  final bool? _success;
  final String? _message;
  final Data? _data;

  bool get success => _success ?? false;

  Data get data => _data ?? Data();

  String get message => _message ?? "";

  factory HouseRules.fromJson(Map json) => HouseRules(
        success: json["success"],
        message: json["message"],
        data: json.containsKey("data") && json["data"] is! List
            ? Data.fromJson(json["data"])
            : Data(),
      );
}

class Data {
  Data({Entities? entities, Pagination? pagination})
      : _entities = entities,
        _pagination = pagination;

  final Entities? _entities;
  final Pagination? _pagination;

  factory Data.fromJson(Map json) => Data(
        pagination: json["pagination"] != null
            ? Pagination.fromJson(json["pagination"])
            : null,
        entities: Entities.fromJson(
          json["entities"] ?? [],
        ),
      );

  Entities get entities => _entities ?? Entities();
  Pagination get pagination => _pagination ?? Pagination();
}

class Entities {
  Entities({List<HouseRule>? rules}) : _rules = rules;

  final List<HouseRule?>? _rules;

  List<HouseRule?> get rules => _rules ?? [];

  factory Entities.fromJson(List jsons) => Entities(
        rules: jsons
            .map(
              (rule) => rule = HouseRule.fromJson(
                Map<String, dynamic>.from(rule),
              ),
            )
            .toList(),
      );
}

class Pagination {
  Pagination({
    int? current_page,
    int? total_pages,
    int? per_page,
    int? count,
    Links? links,
  })  : _current_page = current_page,
        _total_pages = total_pages,
        _per_page = per_page,
        _count = count,
        _links = links;

  final int? _current_page;
  final int? _total_pages;
  final int? _per_page;
  final int? _count;
  final Links? _links;

  int get current_page => _current_page ?? -1;

  int get total_pages => _total_pages ?? -1;

  int get per_page => _per_page ?? -1;

  int get count => _count ?? -1;

  Links get links => _links ?? Links();

  factory Pagination.fromJson(Map json) => Pagination(
        count: json["count"],
        current_page: json["current_page"],
        links: Links.fromJson(json["links"]),
        per_page: json["per_page"],
        total_pages: json["total_pages"],
      );
}

class Links {
  Links({String? next, String? prev})
      : _next = next,
        _prev = prev;

  final String? _next;
  final String? _prev;

  String get next => _next ?? "";

  String get prev => _prev ?? "";

  factory Links.fromJson(Map json) => Links(
        next: json["next"],
        prev: json["prev"],
      );
}
