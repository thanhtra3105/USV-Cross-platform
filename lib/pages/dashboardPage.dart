import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:usv_project/widgets/history_chart.dart';
import 'package:usv_project/widgets/DashboardCard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void reassemble() {
    super.reassemble();
  }

  Future<Map<String, String>> fetchUSVData() async {
    await Future.delayed(Duration(seconds: 4));
    return {
      "Battery": "${Random().nextInt(100)}",
      "Heading": (Random().nextDouble() * 7 + 5).toStringAsFixed(2),
      "pH": (Random().nextDouble() * 7 + 5).toStringAsFixed(2),
      "DO": (Random().nextDouble() * 7 + 5).toStringAsFixed(2),
      "COD": (Random().nextDouble() * 7 + 5).toStringAsFixed(2),
      "TSS": (Random().nextDouble() * 7 + 5).toStringAsFixed(2),
    };
    // throw Exception("Chỉ được một lỗi chung cho tất cả");
  }

  Future<double> fetchPH() async {
    await Future.delayed(Duration(seconds: 2));
    return double.parse((Random().nextDouble() * 7 + 5).toStringAsFixed(2));
  }

  Future<double> fetchDO() async {
    await Future.delayed(Duration(seconds: 4));
    if (Random().nextBool()) throw Exception("fetch DO data failed");
    return double.parse((Random().nextDouble() * 7 + 5).toStringAsFixed(2));
  }

  Future<double> fetchCOD() async {
    await Future.delayed(Duration(seconds: 1));
    if (Random().nextBool()) throw Exception("fetch COD data failed");
    return double.parse((Random().nextDouble() * 7 + 5).toStringAsFixed(2));
  }

  Future<double> fetchTSS() async {
    await Future.delayed(Duration(seconds: 3));
    return double.parse((Random().nextDouble() * 7 + 5).toStringAsFixed(2));
  }

  Future<Map<String, double>> fetchAll() async {
    try {
      final results = await Future.wait([
        fetchPH(),
        fetchDO(),
        fetchCOD(),
        fetchTSS(),
      ]);
      return {
        "pH": results[0],
        "DO": results[1],
        "COD": results[2],
        "TSS": results[3],
      };
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "USV State & Water Quality",
              style: TextStyle(
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 350,
              width: 500,
              child: FutureBuilder(
                future: fetchUSVData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Container(child: Text("Loading...")),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.0,
                        children: [
                          buildDashboardCard(
                            "Battery",
                            "${data["Battery"]}",
                            "%",
                            Icons.battery_6_bar_sharp,
                          ),
                          buildDashboardCard(
                            "Heading",
                            "${data["Heading"]}",
                            "km/h",
                            Icons.speed,
                          ),
                          buildDashboardCard(
                            "pH",
                            "${data["pH"]}",
                            "mol/L",
                            Icons.science,
                          ),
                          buildDashboardCard(
                            "DO",
                            "${data["DO"]}",
                            "mg/L",
                            Icons.opacity,
                          ),
                          buildDashboardCard(
                            "COD",
                            "${data["COD"]}",
                            "mg/L",
                            Icons.waves,
                          ),
                          buildDashboardCard(
                            "TSS",
                            "${data["TSS"]}",
                            "mg/L",
                            Icons.analytics,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Text("Không có dữ liệu!");
                  }
                },
              ),
            ),

            /* dung future.wait()*/
            Container(
              height: 350,
              width: 500,
              child: FutureBuilder(
                future: fetchAll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text("Loading..."),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.error.toString()),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => setState(() {
                              reassemble();
                            }),
                            child: Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.0,
                        children: [
                          buildDashboardCard(
                            "Battery",
                            "100",
                            "%",
                            Icons.battery_0_bar_sharp,
                          ),
                          buildDashboardCard(
                            "Heading",
                            "10.8",
                            "km/h",
                            Icons.speed,
                          ),
                          buildDashboardCard(
                            "pH",
                            "${data["pH"]}",
                            "mol/L",
                            Icons.science,
                          ),
                          buildDashboardCard(
                            "DO",
                            "${data["DO"]}",
                            "mg/L",
                            Icons.opacity,
                          ),
                          buildDashboardCard(
                            "COD",
                            "${data["COD"]}",
                            "mg/L",
                            Icons.waves,
                          ),
                          buildDashboardCard(
                            "TSS",
                            "${data["TSS"]}",
                            "mg/L",
                            Icons.analytics,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text("Khong co data");
                  }
                },
              ),
            ),

            // SizedBox(height: 20),
            Container(
              height: 350,
              width: 500,
              child: HistoryChart(
                title: "Water Quality History",
                dataSets: {
                  "pH": [
                    FlSpot(0, 4.2),
                    FlSpot(1, 4.4),
                    FlSpot(2, 4.1),
                    FlSpot(3, 4.3),
                  ],
                  "COD": [
                    FlSpot(0, 3.1),
                    FlSpot(1, 3.0),
                    FlSpot(2, 2.8),
                    FlSpot(3, 3.2),
                  ],
                  "DO": [
                    FlSpot(0, 1.0),
                    FlSpot(1, 1.2),
                    FlSpot(2, 1.1),
                    FlSpot(3, 1.3),
                  ],
                  "TSS": [
                    FlSpot(0, 5.5),
                    FlSpot(1, 5.7),
                    FlSpot(2, 5.8),
                    FlSpot(3, 6.0),
                  ],
                },
                colors: {
                  "pH": Colors.green,
                  "COD": Colors.orange,
                  "DO": Colors.red,
                  "TSS": Colors.purple,
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
