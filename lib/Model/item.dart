import 'package:boxigo/Model/custom_item.dart';
import 'package:boxigo/Model/inventory.dart';
import 'package:boxigo/Model/type.dart';

class Items {
    List<Inventory> inventory;
    CustomItems customItems;

    Items({
        required this.inventory,
        required this.customItems,
    });

    factory Items.fromJson(Map<String, dynamic> json) => Items(
        inventory: List<Inventory>.from(json["inventory"].map((x) => Inventory.fromJson(x))),
        customItems: CustomItems.fromJson(json["customItems"]),
    );

    Map<String, dynamic> toJson() => {
        "inventory": List<dynamic>.from(inventory.map((x) => x.toJson())),
        "customItems": customItems.toJson(),
    };
}



class Category {
    String id;
    int order;
    String name;
    String displayName;
    List<ChildItemElement> items;

    Category({
        required this.id,
        required this.order,
        required this.name,
        required this.displayName,
        required this.items,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        order: json["order "],
        name: json["name"],
        displayName: json["displayName"],
        items: List<ChildItemElement>.from(json["items"].map((x) => ChildItemElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order ": order,
        "name": name,
        "displayName": displayName,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class ChildItemElement {
    List<Size>? size;
    List<ChildItemElement>? childItems;
    String? typeOptions;
    Meta meta;
    int uniquieId;
    String name;
    String displayName;
    int order;
    String? nameOld;
    int qty;
    List<Type> type;
    String id;

    ChildItemElement({
        required this.size,
        this.childItems,
        required this.typeOptions,
        required this.meta,
        required this.uniquieId,
        required this.name,
        required this.displayName,
        required this.order,
        this.nameOld,
        required this.qty,
        required this.type,
        required this.id,
    });

    factory ChildItemElement.fromJson(Map<String, dynamic> json) => ChildItemElement(
        size: json["size"] == null ? [] : List<Size>.from(json["size"]!.map((x) => Size.fromJson(x))),
        childItems: json["childItems"] == null ? [] : List<ChildItemElement>.from(json["childItems"]!.map((x) => ChildItemElement.fromJson(x))),
        typeOptions: json["typeOptions"],
        meta: Meta.fromJson(json["meta"]),
        uniquieId: json["uniquieId"],
        name: json["name"],
        displayName: json["displayName"],
        order: json["order"],
        nameOld: json["name_old"],
        qty: json["qty"],
        type: List<Type>.from(json["type"].map((x) => Type.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "size": size == null ? [] : List<dynamic>.from(size!.map((x) => x.toJson())),
        "childItems": childItems == null ? [] : List<dynamic>.from(childItems!.map((x) => x.toJson())),
        "typeOptions": typeOptions,
        "meta": meta.toJson(),
        "uniquieId": uniquieId,
        "name": name,
        "displayName": displayName,
        "order": order,
        "name_old": nameOld,
        "qty": qty,
        "type": List<dynamic>.from(type.map((x) => x.toJson())),
        "id": id,
    };
}
class Meta {
    bool hasType;
    SelectType selectType;
    bool hasVariation;
    bool hasSize;

    Meta({
        required this.hasType,
        required this.selectType,
        required this.hasVariation,
        required this.hasSize,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        hasType: json["hasType"],
        selectType: selectTypeValues.map[json["selectType"]]!,
        hasVariation: json["hasVariation"],
        hasSize: json["hasSize"],
    );

    Map<String, dynamic> toJson() => {
        "hasType": hasType,
        "selectType": selectTypeValues.reverse[selectType],
        "hasVariation": hasVariation,
        "hasSize": hasSize,
    };
}

enum SelectType {
    MULTIPLE,
    NONE,
    SINGLE
}

final selectTypeValues = EnumValues({
    "multiple": SelectType.MULTIPLE,
    "none": SelectType.NONE,
    "single": SelectType.SINGLE
});

class Size {
    Option option;
    Tooltip tooltip;
    bool selected;

    Size({
        required this.option,
        required this.tooltip,
        required this.selected,
    });

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        option: optionValues.map[json["option"]]!,
        tooltip: tooltipValues.map[json["tooltip"]]!,
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "option": optionValues.reverse[option],
        "tooltip": tooltipValues.reverse[tooltip],
        "selected": selected,
    };
}

enum Option {
    LARGE,
    MEDIUM,
    SMALL
}

final optionValues = EnumValues({
    "large": Option.LARGE,
    "medium": Option.MEDIUM,
    "small": Option.SMALL
});

enum Tooltip {
    THE_2_FT_2_FT,
    THE_3_FT_3_FT,
    THE_46_FT,
    THE_4_FT,
    THE_4_FT_4_FT,
    THE_6_FT,
    XL,
    XXL,
    XXXL
}


final tooltipValues = EnumValues({
    "2ft * 2ft": Tooltip.THE_2_FT_2_FT,
    "3ft * 3ft": Tooltip.THE_3_FT_3_FT,
    "4-6 ft": Tooltip.THE_46_FT,
    "<4 ft": Tooltip.THE_4_FT,
    "4ft * 4ft": Tooltip.THE_4_FT_4_FT,
    ">6 ft": Tooltip.THE_6_FT,
    "XL": Tooltip.XL,
    "XXL": Tooltip.XXL,
    "XXXL": Tooltip.XXXL
});

