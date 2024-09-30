import 'package:boxigo/Model/item.dart';

class CustomerEstimate {
  String estimateId;
  String movingFrom;
  String movingTo;
  String movingOn;
  String distance;
  String propertySize;
  String oldFloorNo;
  String newFloorNo;
  String oldElevatorAvailability;
  String newElevatorAvailability;
  String oldParkingDistance;
  String newParkingDistance;
  bool unpackingService;
  bool packingService;
  Items items;
  String fromCity;
  String toCity;
  String totalItems;
  String oldHouseAdditionalInfo;
  String newHouseAdditionalInfo;

  CustomerEstimate({
    required this.estimateId,
    required this.movingFrom,
    required this.movingTo,
    required this.movingOn,
    required this.distance,
    required this.propertySize,
    required this.oldFloorNo,
    required this.newFloorNo,
    required this.oldElevatorAvailability,
    required this.newElevatorAvailability,
    required this.oldParkingDistance,
    required this.newParkingDistance,
    required this.unpackingService,
    required this.packingService,
    required this.fromCity,
    required this.toCity,
    required this.totalItems,
    required this.oldHouseAdditionalInfo,
    required this.newHouseAdditionalInfo,
    required this.items,
  });

  factory CustomerEstimate.fromJson(Map<String, dynamic> json) {
    return CustomerEstimate(
      estimateId: json['estimate_id'],
      movingFrom: json['moving_from'],
      movingTo: json['moving_to'],
      movingOn: json['moving_on'],
      distance: json['distance'],
      propertySize: json['property_size'],
      oldFloorNo: json['old_floor_no'],
      newFloorNo: json['new_floor_no'],
      oldElevatorAvailability: json['old_elevator_availability'],
      newElevatorAvailability: json['new_elevator_availability'],
      oldParkingDistance: json['old_parking_distance'],
      newParkingDistance: json['new_parking_distance'],
      unpackingService: json['unpacking_service'] == 'Yes',
      packingService: json['packing_service'] == 'Yes',
      fromCity: json['from_address']['fromCity'],
      toCity: json['to_address']['toCity'],
      totalItems: json['total_items'],
      oldHouseAdditionalInfo: json['old_house_additional_info'],
      newHouseAdditionalInfo: json['new_house_additional_info'],
      items: Items.fromJson(json["items"]),
    );
  }
}
