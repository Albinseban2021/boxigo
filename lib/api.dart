import 'dart:convert';
import 'package:boxigo/Model/customer_detail.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'http://test.api.boxigo.in/sample-data/';

  Future<List<CustomerEstimate>> fetchEstimates() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> estimates = json['Customer_Estimate_Flow'];

      return estimates.map((data) => CustomerEstimate.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load estimates');
    }
  }
}
