import 'package:boxigo/Model/item.dart';
import 'package:boxigo/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeadCard extends StatelessWidget {
  final String fromCity;
  final String toCity;
  final String movingTo;
  final String movingFrom;
  final String propertySize;
  final String totalItems;
  final String distance;
  final String estimateId;
  final String oldFloorNo;
  final String newFloorNo;
  final String oldElevatorAvailability;
  final String newElevatorAvailability;
  final String oldParkingDistance;
  final String newParkingDistance;
  final bool unpackingService;
  final bool packingService;
  final String oldHouseAdditionalInfo;
  final String newHouseAdditionalInfo;
  final String movingOn;
  final Items items;

  const LeadCard({
    super.key,
    required this.fromCity,
    required this.movingFrom,
    required this.propertySize,
    required this.totalItems,
    required this.distance,
    required this.estimateId,
    required this.oldFloorNo,
    required this.newFloorNo,
    required this.oldElevatorAvailability,
    required this.newElevatorAvailability,
    required this.oldParkingDistance,
    required this.newParkingDistance,
    required this.unpackingService,
    required this.packingService,
    required this.oldHouseAdditionalInfo,
    required this.newHouseAdditionalInfo,
    required this.movingOn,
    required this.toCity,
    required this.movingTo,
    required this.items,
  });

  List<String> formatDate(String movingOn) {
    DateTime dateTime = DateTime.parse(movingOn);

    String formattedMonth = DateFormat('MMM').format(dateTime);
    String formattedDay = DateFormat('dd').format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    return [formattedMonth, formattedDay, formattedTime];
  }

  @override
  Widget build(BuildContext context) {
    List<String> formattedDate = formatDate(movingOn);
    return Card(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      formattedDate[0],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      formattedDate[1],
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      formattedDate[2],
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fromCity,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(movingFrom,
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_downward_outlined,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          Column(
                            children: [
                              const Icon(Icons.home, color: Colors.red),
                              const SizedBox(width: 5),
                              Text(propertySize),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              const Icon(Icons.inventory, color: Colors.red),
                              const SizedBox(width: 5),
                              Text('$totalItems items'),
                            ],
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            children: [
                              Icon(Icons.archive, color: Colors.red),
                              SizedBox(width: 5),
                              Text('15 boxes'),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              const Icon(Icons.route_outlined,
                                  color: Colors.red),
                              const SizedBox(width: 5),
                              Text('$distance '),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(toCity,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(movingTo,
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LeadDetailsPage(
                                      newElevatorAvailability:
                                          newElevatorAvailability,
                                      newFloorNo: newFloorNo,
                                      newHouseAdditionalInfo:
                                          newHouseAdditionalInfo,
                                      newParkingDistance: newParkingDistance,
                                      oldElevatorAvailability:
                                          oldElevatorAvailability,
                                      oldFloorNo: oldFloorNo,
                                      oldHouseAdditionalInfo:
                                          oldHouseAdditionalInfo,
                                      oldParkingDistance: oldParkingDistance,
                                      packingService: packingService,
                                      unpackingService: unpackingService,
                                      items: items,
                                    ),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.red),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Text(
                                'View Details',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                              ),
                              child: const Text(
                                'Submit Quote',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(estimateId,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
