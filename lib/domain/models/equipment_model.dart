import 'dart:convert';

AllEquipmentModel equipmentEntryFromJson(String str) =>
    AllEquipmentModel.fromJson(json.decode(str));

String equipmentEntryToJson(AllEquipmentModel data) =>
    json.encode(data.toJson());

class AllEquipmentModel {
  List<EquipmentModel> data;

  AllEquipmentModel({
    required this.data,
  });

  factory AllEquipmentModel.fromJson(Map<String, dynamic> json) =>
      AllEquipmentModel(
        data: List<EquipmentModel>.from(
            json["data"].map((x) => EquipmentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EquipmentModel {
  Category category;
  List<String>? commonLocations;
  String description;
  bool dlc;
  int id;
  String image;
  String name;
  Properties properties;

  EquipmentModel({
    required this.category,
    required this.commonLocations,
    required this.description,
    required this.dlc,
    required this.id,
    required this.image,
    required this.name,
    required this.properties,
  });

  factory EquipmentModel.fromJson(Map<String, dynamic> json) => EquipmentModel(
        category: categoryValues.map[json["category"]]!,
        commonLocations: json["common_locations"] == null
            ? []
            : List<String>.from(json["common_locations"]!.map((x) => x)),
        description: json["description"],
        dlc: json["dlc"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
        properties: Properties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse[category],
        "common_locations": commonLocations == null
            ? []
            : List<dynamic>.from(commonLocations!.map((x) => x)),
        "description": description,
        "dlc": dlc,
        "id": id,
        "image": image,
        "name": name,
        "properties": properties.toJson(),
      };
}

enum Category { EQUIPMENT }

final categoryValues = EnumValues({"equipment": Category.EQUIPMENT});

class Properties {
  int? attack;
  int? defense;

  Properties({
    required this.attack,
    required this.defense,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        attack: json["attack"],
        defense: json["defense"],
      );

  Map<String, dynamic> toJson() => {
        "attack": attack,
        "defense": defense,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
