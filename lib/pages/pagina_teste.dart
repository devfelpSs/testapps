import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CircularPercentIndicatorPage extends StatelessWidget {
  const CircularPercentIndicatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Percent Indicator"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 130.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 15.0,
                percent: 0.4,
                center: new Text(
                  "40 hours",
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
              new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.9,
                center: Text("90.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}