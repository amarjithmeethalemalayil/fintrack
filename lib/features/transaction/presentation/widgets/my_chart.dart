import 'package:fin_track/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class FinancialData {
  final String day;
  final double income;
  final double expense;

  FinancialData(this.day, this.income, this.expense);
}

class MyChart extends StatelessWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final List<FinancialData> chartData = [
      FinancialData('Mon', 1000.0, 500.0),
      FinancialData('Tue', 1200.0, 750.0),
      FinancialData('Wed', 800.0, 300.0),
      FinancialData('Thu', 1500.0, 900.0),
      FinancialData('Fri', 900.0, 600.0),
      FinancialData('Sat', 600.0, 200.0),
      FinancialData('Sun', 1100.0, 400.0),
    ];

    return Container(
      height: screenHeight * 0.5,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color:  MyColors.graphBgColor, 
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
      ),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        margin: EdgeInsets.zero,
        title: ChartTitle(
          text: 'Weekly Income & Expenses',
          textStyle: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            color: MyColors.whiteColor,
          ),
        ),
        legend: Legend(
          isVisible: true,
          textStyle: TextStyle(
            fontSize: screenWidth * 0.035,
            color: MyColors.lightTextColor,
          ),
          position: LegendPosition.top,
          iconHeight: screenWidth * 0.035,
          iconWidth: screenWidth * 0.035,
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          header: '',
          canShowMarker: true,
          textStyle: TextStyle(
            fontSize: screenWidth * 0.035,
            color: MyColors.balckColor,
          ),
        ),
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
            fontSize: screenWidth * 0.035,
            color: MyColors.lightTextColor,
          ),
          majorGridLines: const MajorGridLines(width: 0),
          axisLine:  AxisLine(width: 1, color: MyColors.white30),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
            text: 'Amount (\₹)',
            textStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: MyColors.whiteColor,
            ),
          ),
          numberFormat: NumberFormat.compact(),
          minimum: 0,
          maximum: 2000,
          interval: 500,
          labelStyle: TextStyle(
            fontSize: screenWidth * 0.03,
            color: MyColors.lightTextColor,
          ),
          majorGridLines: const MajorGridLines(width: 0),
          axisLine:  AxisLine(width: 1, color: MyColors.white30),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        series: <CartesianSeries>[
          ColumnSeries<FinancialData, String>(
            width: 0.6,
            spacing: 0.2,
            dataSource: chartData,
            xValueMapper: (datum, _) => datum.day,
            yValueMapper: (datum, _) => datum.income,
            name: 'Income',
            color: MyColors.greenColor,
          ),
          ColumnSeries<FinancialData, String>(
            width: 0.6,
            spacing: 0.2,
            dataSource: chartData,
            xValueMapper: (datum, _) => datum.day,
            yValueMapper: (datum, _) => datum.expense,
            name: 'Expense',
            color: MyColors.redColor,
          ),
        ],
      ),
    );
  }
}
