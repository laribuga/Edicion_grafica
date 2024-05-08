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
      data.add(FlSpot(i.toDouble(), random.nextDouble() * 10000)); // Random value between 0 and 100
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
            Container(
              width: 500, // Fixed width
              height: 300, // Fixed height
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: data1,
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 1,
                      dotData: FlDotData(show: false),
                    ),
                    // LineChartBarData(
                    //   spots: data2,
                    //   isCurved: true,
                    //   colors: [Colors.red],
                    //   barWidth: 1,
                    //   dotData: FlDotData(show: false),
                    // ),
                  ],
                  minY: 0,
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(showTitles: false),
                  ),
                ),
                swapAnimationDuration: const Duration(milliseconds: 500),
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: updateGraphData,
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Graph Example',
//       home: GraphExample(),
//     );
//   }
// }

// class GraphExample extends StatefulWidget {
//   @override
//   _GraphExampleState createState() => _GraphExampleState();
// }

// class _GraphExampleState extends State<GraphExample> {
//   Random random = Random();

//   List<FlSpot> generateRandomData(int count) {
//     List<FlSpot> data = [];
//     for (int i = 0; i < count; i++) {
//       data.add(FlSpot(i.toDouble(), random.nextDouble() * 10000)); // Random value between 0 and 100
//     }
//     return data;
//   }

//   List<FlSpot> data1 = [];
//   List<FlSpot> data2 = [];

//   @override
//   void initState() {
//     super.initState();
//     data1 = generateRandomData(100); // Generate initial random data for data1
//     //data2 = generateRandomData(100); // Generate initial random data for data2
//   }

//   void updateGraphData() {
//     setState(() {
//       // Update data1 and data2 with new random data
//       data1 = generateRandomData(100);
//       //data2 = generateRandomData(100);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Graph Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 500, // Fixed width
//               height: 300, // Fixed height
//               child: LineChart(
//                 LineChartData(
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: data1,
//                       isCurved: true,
//                       colors: [Colors.blue],
//                       barWidth: 1,
//                       dotData: FlDotData(show: false),
//                     ),
//                     // LineChartBarData(
//                     //   spots: data2,
//                     //   isCurved: true,
//                     //   colors: [Colors.red],
//                     //   barWidth: 1,
//                     //   dotData: FlDotData(show: false),
//                     // ),
//                   ],
//                   minY: 0,
//                   titlesData: FlTitlesData(
//                     bottomTitles: SideTitles(showTitles: false),
//                   ),
//                 ),
//                 swapAnimationDuration: const Duration(milliseconds: 500),
//               ),
//             ),
//             const SizedBox(height: 100),
//             ElevatedButton(
//               onPressed: updateGraphData,
//               child: const Text('Update Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
