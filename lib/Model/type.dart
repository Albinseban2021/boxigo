class Type {
    String id;
    String option;
    bool selected;

    Type({
        required this.id,
        required this.option,
        required this.selected,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        option: json["option"],
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "option": option,
        "selected": selected,
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