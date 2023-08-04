import 'package:avengers/util.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TemperatureHumidityChart extends StatefulWidget {
  @override
  _TemperatureHumidityChartState createState() =>
      _TemperatureHumidityChartState();
}

class _TemperatureHumidityChartState extends State<TemperatureHumidityChart> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<DataPoint> dataPoints = [];

  @override
  void initState() {
    super.initState();
    // Firestore에서 데이터 변경을 실시간으로 감지하여 업데이트합니다.
    firestore
        .collection('temperature_humidity')
        .orderBy('time', descending: false)
        .snapshots()
        .listen((snapshot) {
      setState(() {
        dataPoints.clear();
        for (var doc in snapshot.docs) {
          Map<String, dynamic> data = doc.data();
          String time = data['time'];
          double temperature = data['temperature'].toDouble();
          double humidity = data['humidity'].toDouble();
          dataPoints.add(DataPoint(time, temperature, humidity));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('온습도 모니터링'),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.all(16.0),
            child: SfCartesianChart(
              title: ChartTitle(
                text: '온도 모니터링',
                alignment: ChartAlignment.near,
              ),
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                LineSeries<DataPoint, String>(
                  dataSource: dataPoints,
                  xValueMapper: (data, _) => data.time,
                  yValueMapper: (data, _) => data.temperature,
                  name: 'Temperature',
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.all(16.0),
            child: SfCartesianChart(
              title: ChartTitle(
                text: '습도 모니터링',
                alignment: ChartAlignment.near,
              ),
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                LineSeries<DataPoint, String>(
                  dataSource: dataPoints,
                  xValueMapper: (data, _) => data.time,
                  yValueMapper: (data, _) => data.humidity,
                  name: 'Humidity',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataPoint {
  final String time;
  final double temperature;
  final double humidity;

  DataPoint(this.time, this.temperature, this.humidity);
}
