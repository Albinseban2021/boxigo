import 'package:boxigo/Model/custom_item.dart';
import 'package:boxigo/Model/inventory.dart';
import 'package:boxigo/Model/item.dart';
import 'package:boxigo/floor_info.dart';
import 'package:flutter/material.dart';

class LeadDetailsPage extends StatelessWidget {
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
  final Items items;

  const LeadDetailsPage(
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
      required this.newHouseAdditionalInfo,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Leads'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: 'Items'),
              Tab(text: 'Floor Info'),
              Tab(text: 'Send Quote'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.inventory.length,
                    itemBuilder: (context, index) {
                      return RoomFurnitureCard(items.inventory[index]);
                    },
                  ),
                  CustomItemsSection(items.customItems),
                ],
              ),
            ),
            FloorInfoPage(
              newElevatorAvailability: newElevatorAvailability,
              newFloorNo: newFloorNo,
              newHouseAdditionalInfo: newHouseAdditionalInfo,
              newParkingDistance: newParkingDistance,
              oldElevatorAvailability: oldElevatorAvailability,
              oldFloorNo: oldFloorNo,
              oldHouseAdditionalInfo: oldHouseAdditionalInfo,
              oldParkingDistance: oldParkingDistance,
              packingService: packingService,
              unpackingService: unpackingService,
            ),
            const Center(
              child: Text(
                'Send Quote - In Progress',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomFurnitureCard extends StatefulWidget {
  final Inventory room;

  const RoomFurnitureCard(this.room, {super.key});

  @override
  State<RoomFurnitureCard> createState() => _RoomFurnitureCardState();
}

class _RoomFurnitureCardState extends State<RoomFurnitureCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        color: Colors.grey.shade300,
        child: Text(
          widget.room.displayName,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      collapsedIconColor: Colors.black,
      iconColor: Colors.black,
      children: widget.room.category.map<Widget>((category) {
        var filteredItems =
            category.items.where((item) => item.qty > 0).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: filteredItems.map<Widget>((item) {
            return ListTile(
              leading: const Icon(Icons.chair, color: Colors.red),
              title: Text('   ${item.displayName}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item.size != null && item.size!.isNotEmpty
                      ? Text(
                          'Size: ${item.size!.map((s) => s.option.name).join(', ')}')
                      : const SizedBox.shrink(),
                  item.type.isNotEmpty
                      ? Text(
                          'Type: ${item.type.map((t) => t.option).join(', ')}')
                      : const SizedBox.shrink(),
                ],
              ),
              trailing: Text(' ${item.qty}'),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}

class CustomItemsSection extends StatelessWidget {
  final CustomItems customItems;

  const CustomItemsSection(this.customItems, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            color: Colors.grey.shade300,
            child: const Text(
              'Custom Items',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: customItems.items.map((item) {
            return ListTile(
              title: Text(item.itemName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.itemDescription),
                  const SizedBox(height: 5),
                  Text(
                    'Dimensions: L: ${item.itemLength}, W: ${item.itemWidth}, H: ${item.itemHeight}',
                    style:const  TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              trailing: Text(' ${item.itemQty}'),
            );
          }).toList(),
        ),
      ],
    );
  }
}
