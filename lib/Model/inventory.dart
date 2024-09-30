import 'package:boxigo/Model/item.dart';

class Inventory {
    String id;
    int order;
    String name;
    String displayName;
    List<Category> category;

    Inventory({
        required this.id,
        required this.order,
        required this.name,
        required this.displayName,
        required this.category,
    });

    factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"],
        order: json["order"],
        name: json["name"],
        displayName: json["displayName"],
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "name": name,
        "displayName": displayName,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
    };
}
