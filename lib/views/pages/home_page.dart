// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Text('Future function for get IoT data'),
//       ),
//     );
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Simulate fectch IoT data
  Future<double> fetchBattery() async {
    await Future.delayed(Duration(seconds: 2));
    return 86.5;
  }

  Future<double> fetchSpeed() async {
    await Future.delayed(Duration(seconds: 1));
    return 4.3;
  }

  Future<double> fetchPH() async {
    await Future.delayed(Duration(seconds: 2));
    return 7.2;
  }

  Future<double> fetchDO() async {
    await Future.delayed(Duration(seconds: 3));
    return 6.8;
  }

  Future<double> fetchCOD() async {
    await Future.delayed(Duration(seconds: 3));
    if (Random().nextBool()) throw Exception("COD sensor error");
    return 28.4;
  }

  Future<double> fetchTSS() async {
    await Future.delayed(Duration(seconds: 2));
    return 15.7;
  }

  // Combine multiple futures
  Future<Map<String, dynamic>> fetchAll() async {
    try {
      final results = await Future.wait([
        fetchBattery(),
        fetchSpeed(),
        fetchPH(),
        fetchDO(),
        fetchCOD(),
        fetchTSS(),
      ]);
      return {
        "Battery Level": {"value": results[0], "unit": "%"},
        "Vessel Speed": {"value": results[1], "unit": "km/h"},
        "pH Level": {"value": results[2], "unit": ""},
        "Dissolved Oxygen": {"value": results[3], "unit": "mg/L"},
        "COD": {"value": results[4], "unit": "mg/L"},
        "TSS": {"value": results[5], "unit": "mg/L"},
      };
    } catch (e) {
      throw Exception("Error fetching IoT data: $e");
    }
  }

  // Widget for each card display data
  Widget buildSensorCard({
    required String title,
    required String unit,
    required dynamic value,
    IconData? icon,
    Color? color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                if (icon != null)
                  Icon(icon, color: color ?? Colors.blueGrey, size: 22),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value != null ? "${value.toStringAsFixed(1)} $unit" : "-- $unit",
              style: TextStyle(
                fontSize: 20,
                color: color ?? Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Loading data..."),
              ],
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 40),
                const SizedBox(height: 8),
                Text(
                  "Error: ${snapshot.error}",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => (context as Element).reassemble(),
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        final data = snapshot.data!;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Water Quality Monitoring",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Real-time monitoring of autonomous water quality vessel",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  buildSensorCard(
                    title: "Battery Level",
                    unit: "%",
                    value: data["Battery Level"]["value"],
                    color: Colors.green,
                    icon: Icons.battery_full,
                  ),
                  buildSensorCard(
                    title: "Vessel Speed",
                    unit: "km/h",
                    value: data["Vessel Speed"]["value"],
                    color: Colors.blue,
                    icon: Icons.speed,
                  ),
                  buildSensorCard(
                    title: "pH Level",
                    unit: "",
                    value: data["pH Level"]["value"],
                    color: Colors.teal,
                    icon: Icons.eco,
                  ),
                  buildSensorCard(
                    title: "Dissolved Oxygen",
                    unit: "mg/L",
                    value: data["Dissolved Oxygen"]["value"],
                    icon: Icons.water_drop,
                  ),
                  buildSensorCard(
                    title: "COD",
                    unit: "mg/L",
                    value: data["COD"]["value"],
                    icon: Icons.science,
                    color: Colors.orange,
                  ),
                  buildSensorCard(
                    title: "TSS",
                    unit: "mg/L",
                    value: data["TSS"]["value"],
                    icon: Icons.analytics,
                    color: Colors.pink,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
