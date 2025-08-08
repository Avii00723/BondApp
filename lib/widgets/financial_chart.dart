import 'package:flutter/material.dart';

import '../models/bond_search_model.dart';

class FinancialChart extends StatefulWidget {
  final FinancialData financialData;

  const FinancialChart({
    super.key,
    required this.financialData,
  });

  @override
  State<FinancialChart> createState() => _FinancialChartState();
}

class _FinancialChartState extends State<FinancialChart> {
  bool _showRevenue = false; // Start with EBITDA selected

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'COMPANY FINANCIALS',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),

          // Toggle buttons to switch between datasets
          Row(
            children: [
              _buildToggleButton('EBITDA', !_showRevenue),
              const SizedBox(width: 8),
              _buildToggleButton('Revenue', _showRevenue),
            ],
          ),


          const SizedBox(height: 10),
          Text(
            '2024 - 2025',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: CustomPaint(
              painter: _showRevenue
                  ? SimpleBarChartPainter(widget.financialData.revenue, Colors.blue)
                  : StackedBarChartPainter(
                widget.financialData.revenue,
                widget.financialData.ebitda,
              ),
              size: Size.infinite,
            ),
          ),
          const SizedBox(height: 16),
          // Month labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: (_showRevenue
                ? widget.financialData.revenue
                : widget.financialData.ebitda).take(12).map((monthData) => Text(
              monthData.month.substring(0, 1).toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showRevenue = label == 'Revenue';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class SimpleBarChartPainter extends CustomPainter {
  final List<MonthlyData> data;
  final Color barColor;

  SimpleBarChartPainter(this.data, this.barColor);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final barWidth = size.width / data.length * 0.6;
    final maxValue = data.map((d) => d.value).reduce((a, b) => a > b ? a : b);
    final spacing = size.width / data.length;

    for (int i = 0; i < data.length; i++) {
      final dataPoint = data[i];
      final barHeight = (dataPoint.value / maxValue) * size.height * 0.8;
      final x = spacing * i + (spacing - barWidth) / 2;
      final y = size.height - barHeight;

      final barPaint = Paint()
        ..color = barColor
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, barHeight),
          const Radius.circular(2),
        ),
        barPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class StackedBarChartPainter extends CustomPainter {
  final List<MonthlyData> revenueData;
  final List<MonthlyData> ebitdaData;

  StackedBarChartPainter(this.revenueData, this.ebitdaData);

  @override
  void paint(Canvas canvas, Size size) {
    if (revenueData.isEmpty || ebitdaData.isEmpty) return;

    final barWidth = size.width / revenueData.length * 0.6;
    final spacing = size.width / revenueData.length;

    // Find max value from revenue data for scaling
    final maxValue = revenueData.map((d) => d.value).reduce((a, b) => a > b ? a : b);

    for (int i = 0; i < revenueData.length && i < ebitdaData.length; i++) {
      final revenuePoint = revenueData[i];
      final ebitdaPoint = ebitdaData[i];

      final x = spacing * i + (spacing - barWidth) / 2;

      // Calculate heights
      final totalRevenueHeight = (revenuePoint.value / maxValue) * size.height * 0.8;
      final ebitdaHeight = (ebitdaPoint.value / maxValue) * size.height * 0.8;
      final differenceHeight = totalRevenueHeight - ebitdaHeight;

      // Draw black EBITDA bar (bottom portion)
      final ebitdaPaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
              x,
              size.height - ebitdaHeight,
              barWidth,
              ebitdaHeight
          ),
          const Radius.circular(2),
        ),
        ebitdaPaint,
      );

      if (differenceHeight > 0) {
        final differencePaint = Paint()
          ..color = Colors.blue.withOpacity(0.3)
          ..style = PaintingStyle.fill;

        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
                x,
                size.height - totalRevenueHeight,
                barWidth,
                differenceHeight
            ),
            const Radius.circular(2),
          ),
          differencePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}