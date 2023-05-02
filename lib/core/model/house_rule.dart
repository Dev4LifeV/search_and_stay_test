class HouseRule {
  HouseRule({int? id, int? active, int? order, String? name})
      : _id = id,
        _active = active,
        _order = order,
        _name = name;

  final int? _id;
  final int? _active;
  final int? _order;
  final String? _name;

  int get id => _id ?? -1;

  int get active => _active ?? -1;

  int get order => _order ?? -1;

  String get name => _name ?? "";

  factory HouseRule.fromJson(Map<String, dynamic> json) => HouseRule(
        active: json["active"],
        id: json["id"],
        name: json["name"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "house_rules": {
          "name": name,
          "active": active,
        }
      };

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) {
    return other is HouseRule && _id == other.id;
  }
}
