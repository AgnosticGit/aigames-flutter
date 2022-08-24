import 'package:aigames_flutter/core/di/di.dart';
import 'package:aigames_flutter/core/style/texts.dart';
import 'package:aigames_flutter/entities/gradient_descent_2d_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../core/state_manager/app_builder.dart';

class GradientDescentPage extends StatefulWidget {
  const GradientDescentPage({Key? key}) : super(key: key);

  @override
  State<GradientDescentPage> createState() => _GradientDescentPageState();
}

class _GradientDescentPageState extends State<GradientDescentPage> {
  @override
  void initState() {
    Di.gradientDescent2d.initGradientDescent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Texts.gradientDescent),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            width: 300.0,
            child: Row(
              children: [
                const Text(Texts.fOfX),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: Texts.enterExpressionHint,
                      hintStyle: TextStyle(fontSize: 12.0),
                    ),
                    onChanged: Di.gradientDescent2d.onEnterMathExpression,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Di.gradientDescent2d.setMathExpression();
            },
            child: const Text(Texts.buildGraph),
          ),
          const SizedBox(height: 50.0),
          AppBuilder<GradientDescent2dEntity>(
            observable: Di.gradientDescent2d,
            builder: (entity) {
              return SizedBox(
                width: 300,
                height: 300,
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        color: Colors.black,
                        barWidth: 1,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                        spots: entity.model.pointsToFlSpot(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
