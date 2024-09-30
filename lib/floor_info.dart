import 'package:flutter/material.dart';

class FloorInfoPage extends StatelessWidget {
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
  const FloorInfoPage(
      {super.key,
      required this.oldFloorNo,
      required this.newFloorNo,
      required this.oldElevatorAvailability,
      required this.newElevatorAvailability,
      required this.oldParkingDistance,
      required this.newParkingDistance,
      required this.unpackingService,
      required this.packingService,
      required this.oldHouseAdditionalInfo,
      required this.newHouseAdditionalInfo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Existing house details',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          InfoRow(label: 'Floor No.', value: oldFloorNo),
          InfoRow(label: 'Elevator Available', value: oldElevatorAvailability),
          InfoRow(
              label: 'Packing Required',
              value: packingService == true ? 'Yes' : 'No'),
          InfoRow(
              label: 'Distance from door to truck', value: oldParkingDistance),
          Column(
            children: [
              const Text(
                'Additional Information',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                oldHouseAdditionalInfo,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'New house details',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          InfoRow(label: 'Floor No.', value: newFloorNo),
          InfoRow(label: 'Elevator Available', value: newElevatorAvailability),
          InfoRow(
              label: 'Unpacking Required',
              value: unpackingService == true ? 'Yes' : 'No'),
          InfoRow(
              label: 'Distance from door to truck', value: newParkingDistance),
          Column(
            children: [
              const Text(
                'Additional Information',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                newHouseAdditionalInfo,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
