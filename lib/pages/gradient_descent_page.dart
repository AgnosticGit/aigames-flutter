import 'package:aigames_flutter/core/di/di.dart';
import 'package:aigames_flutter/core/style/texts.dart';
import 'package:aigames_flutter/entities/gradient_descent_2d_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 3),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 4.0,
                ),
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
                      child: TextFormField(
                        initialValue: Di.gradientDescent2d.model.mathExpression,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: Texts.enterExpressionHint,
                          hintStyle: TextStyle(fontSize: 12.0),
                        ),
                        onChanged: Di.gradientDescent2d.onEnterMathExpression,
                      ),
                    ),
                    SizedBox(
                      width: 130.0,
                      child: ElevatedButton(
                        onPressed: Di.gradientDescent2d.setMathExpression,
                        child: const Text(Texts.buildGraph),
                      ),
                    ),
                  ],
                ),
              ),
              AppBuilder<GradientDescent2dEntity>(
                observable: Di.gradientDescent2d,
                builder: (context) {
                  return _buildGraph();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGraph() {
    if (Di.gradientDescent2d.model.mathExpression == null) {
      return const SizedBox();
    }

    return Column(
      children: [
        const SizedBox(height: 30.0),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 4.0,
          ),
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
              Expanded(
                child: TextFormField(
                  initialValue: Di.gradientDescent2d.model.pointX?.toString(),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: Texts.setXHint,
                    hintStyle: TextStyle(fontSize: 12.0),
                  ),
                  onChanged: Di.gradientDescent2d.onEnterPointX,
                ),
              ),
              SizedBox(
                width: 130.0,
                child: ElevatedButton(
                  onPressed: Di.gradientDescent2d.setPointX,
                  child: const Text(Texts.setX),
                ),
              ),
            ],
          ),
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
                      color: Colors.green,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                      spots: entity.model.pointsToFlSpot(),
                    ),
                    ..._buildCurrentPoint(),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: Di.gradientDescent2d.descent,
              child: const Text(Texts.descent),
            ),
            const SizedBox(width: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: Di.gradientDescent2d.descent,
              child: const Text(Texts.reset),
            ),
          ],
        ),
      ],
    );
  }

  List<LineChartBarData> _buildCurrentPoint() {
    final x = Di.gradientDescent2d.model.pointX;
    final y = Di.gradientDescent2d.model.pointY;

    if (x != null && y != null) {
      return [
        LineChartBarData(
          color: Colors.orange,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(show: false),
          spots: [FlSpot(x, y)],
        ),
      ];
    }

    return [];
  }
}
