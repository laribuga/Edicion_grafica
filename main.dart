import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graph Example',
      home: GraphExample(),
    );
  }
}

class GraphExample extends StatefulWidget {
  @override
  _GraphExampleState createState() => _GraphExampleState();
}

class _GraphExampleState extends State<GraphExample> {
  Random random = Random();

  List<FlSpot> generateRandomData(int count) {
    List<FlSpot> data = [];
    for (int i = 0; i < count; i++) {
      double y = random.nextDouble() * 65000;
      double x = i.toDouble();
      double displacement =0.03456 * pow(y, 0.6052) - 1.496;//displacement = 2; //Aquí poner la fórmula

      data.add(FlSpot(x, displacement)); // Random value between 0 and 100
    }
    return data;
  }

  List<FlSpot> data1 = [];
  List<FlSpot> data2 = [];

  @override
  void initState() {
    super.initState();
    data1 = generateRandomData(100); // Generate initial random data for data1
    //data2 = generateRandomData(100); // Generate initial random data for data2
  }

  void updateGraphData() {
    setState(() {
      // Update data1 and data2 with new random data
      data1 = generateRandomData(100);
      //data2 = generateRandomData(100);
    });
  }
  List<Color> gradientColors = [
    Color.fromARGB(255, 198, 154, 172), //Cyan
    Color.fromARGB(255, 243, 33, 68),
    Color.fromARGB(199, 172, 41, 63), //Blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graph Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(25, 144, 157, 166),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 500, // Fixed width
                height: 300, // Fixed height
                child: LineChart(
                  LineChartData(
                    //backgroundColor: Color.fromARGB(79, 144, 157, 166),
                    //lineTouchData: LineTouchData(enabled: false),
                    gridData: FlGridData(
                      show: false,
                      drawHorizontalLine: true,
                      drawVerticalLine: true,
                      verticalInterval: 10,
                      horizontalInterval: 10,//10000,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Color.fromARGB(255, 178, 188, 196),
                          strokeWidth: 1,
                        );
                      },
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Color.fromARGB(255, 178, 188, 196),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                      //border: Border.all(color: Color.fromARGB(0, 236, 239, 241)),
                    ),
                    minY: 0,
                    maxY: 35,
                  
                    lineBarsData: [
                      LineChartBarData(
                        spots: data1,
                        isCurved: true,
                        colors: gradientColors,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: gradientColors
                                .map((color) => color.withOpacity(0.3))
                                .toList(),
                          cutOffY: 0,
                          applyCutOffY: true,
                        )
                      ),
                      // LineChartBarData(
                      //   spots: data2,
                      //   isCurved: true,
                      //   colors: [Colors.red],
                      //   barWidth: 1,
                      //   dotData: FlDotData(show: false),
                      // ),
                    ],
                    titlesData: FlTitlesData(
                      bottomTitles: SideTitles(showTitles: false),
                      leftTitles: SideTitles(showTitles: false)
                    ),
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: updateGraphData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 229, 163, 163),//gradientColors[0],
                foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
                child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
