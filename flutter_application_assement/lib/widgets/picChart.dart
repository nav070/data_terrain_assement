import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> programs;
  const PieChartWidget({super.key, required this.programs});

  @override
  Widget build(BuildContext context) {
    int total = programs.fold(0, (a, b) => a + (b['count'] as int));

    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: List.generate(
                    programs.length,
                    (index) => PieChartSectionData(
                      color: programs[index]['color'] ?? const Color(0xFFD9D9D9),
                      value: programs[index]['count'].toDouble(),
                      title: '',
                      radius: 32,
                    ),
                  ),
                  sectionsSpace: 0,
                  centerSpaceColor: Colors.white,
                ),
                // duration: const Duration(milliseconds: 300),
                // curve: Curves.easeInOut,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text(
                    'Total Programs',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$total',
                    style:  const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 12,
          children: List.generate(
            programs.length,
            (index) {
              final item = programs[index];
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: item['color'] ?? const Color(0xFFD9D9D9),
                    ),
                  ),
                  Text(
                    '${item['type']}',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '(${item['count']})',
                    style:  const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
