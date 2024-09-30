import 'package:boxigo/Model/customer_detail.dart';
import 'package:boxigo/api.dart';
import 'package:boxigo/card.dart';
import 'package:flutter/material.dart';

class LeadListView extends StatefulWidget {
  const LeadListView({super.key});

  @override
  State<LeadListView> createState() => _LeadListViewState();
}

class _LeadListViewState extends State<LeadListView> {
  List<CustomerEstimate> estimates = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEstimates();
  }

  Future<void> fetchEstimates() async {
    try {
      ApiService apiService = ApiService();
      final fetchedEstimates = await apiService.fetchEstimates();
      setState(() {
        estimates = fetchedEstimates;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error fetching estimates: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: estimates.length,
      itemBuilder: (context, index) {
        final estimate = estimates[index];

        return LeadCard(
          movingTo: estimate.movingTo,
          toCity: estimate.toCity,
          movingOn: estimate.movingOn,
          newElevatorAvailability: estimate.newElevatorAvailability,
          newFloorNo: estimate.newFloorNo,
          newHouseAdditionalInfo: estimate.newHouseAdditionalInfo,
          newParkingDistance: estimate.newParkingDistance,
          oldElevatorAvailability: estimate.oldElevatorAvailability,
          oldFloorNo: estimate.oldFloorNo,
          oldHouseAdditionalInfo: estimate.oldHouseAdditionalInfo,
          oldParkingDistance: estimate.oldParkingDistance,
          packingService: estimate.packingService,
          unpackingService: estimate.unpackingService,
          estimateId: estimate.estimateId,
          distance: estimate.distance,
          fromCity: estimate.fromCity,
          movingFrom: estimate.movingFrom,
          propertySize: estimate.propertySize,
          totalItems: estimate.totalItems,
          items: estimate.items,
        );
      },
    );
  }
}
