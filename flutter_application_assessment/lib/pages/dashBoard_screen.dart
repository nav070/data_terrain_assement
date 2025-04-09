import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_assement/properties/assets.dart';
import 'package:flutter_application_assement/widgets/dropDown.dart';
import 'package:flutter_application_assement/widgets/picChart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width > 600 ? 32 : 16),
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).width > 600 ? 36 : 24,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: _buildPlannedPrograms(context),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: _buildStatusMetrics(),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPlannedPrograms(context),
                  _buildStatusMetrics(),
                ],
              );
            }
          },
        ),
        _buildTopPrograms(),
        _buildTopMentors(),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: _buildTypeMetrics()),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(child: _buildModeMetrics()),
                ],
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTypeMetrics(),
                  _buildModeMetrics(),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildModeMetrics() {
    List<Map<String, dynamic>> programs = [
      {'type': 'Virtual', 'count': 36, 'color': const Color(0xFF1D5BBF)},
      {'type': 'Physical', 'count': 50, 'color': const Color(0xFFD4E6FF)},
    ];

    return Container(
      height: 415,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width > 600 ? 36 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF00AEBD),
                      Color(0xFF1D5BBF),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Program Mode Metrics',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              const DropDownWidget(
                items: ['Month', 'Year'],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 0,
            ),
          ),
          const SizedBox(height: 14),
          Expanded(child: PieChartWidget(programs: programs)),
        ],
      ),
    );
  }

  Widget _buildTypeMetrics() {
    List<Map<String, dynamic>> programs = [
      {'type': 'Premium', 'count': 40, 'color': const Color(0xFFFFBB00)},
      {'type': 'Free', 'count': 54, 'color': const Color(0xFF1D5BBF)},
    ];

    return Container(
      height: 415,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width > 600 ? 36 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF00AEBD),
                      Color(0xFF1D5BBF),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Program Type Metrics',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              const DropDownWidget(
                items: ['Month', 'Year'],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 0,
            ),
          ),
          const SizedBox(height: 14),
          Expanded(child: PieChartWidget(programs: programs)),
        ],
      ),
    );
  }

  Widget _buildRowText({
    required String text,
    Color color = Colors.black,
    bool isMedium = false,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: isMedium ? FontWeight.w500 : FontWeight.w400,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTopPrograms() {
    List<String> columns = [
      'Program Name',
      'Category',
      'Created By',
      'Email',
      'View',
    ];

    List<Map<String, dynamic>> data = [
      {
        'program': 'Leadership Growth',
        'category': 'Engineer',
        'createdBy': '(202) 555–0191',
        'email': 'contact@c',
      },
      {
        'program': 'Tech Mentorship',
        'category': 'Doctor',
        'createdBy': '(303) 555–0123',
        'email': 'support@li',
      },
      {
        'program': 'Career Guidance',
        'category': 'Artist',
        'createdBy': '(404) 555–0145',
        'email': 'info@techs',
      },
      {
        'program': 'Business Skills',
        'category': 'Chef',
        'createdBy': '(505) 555–0167',
        'email': 'hello@desi',
      },
      {
        'program': 'Soft Skills',
        'category': 'Teacher',
        'createdBy': '(606) 555–0189',
        'email': 'team@futu',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width > 600 ? 36 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF00AEBD),
                      Color(0xFF1D5BBF),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Top Programs',
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Image.asset(
                AppAssets.link,
                height: 12,
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: const Color(0xFFDFEDFF),
                ),
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 0,
            ),
          ),
          const SizedBox(height: 14),
          TableTemplateWidget(
            columns: columns,
            dataRow: List.generate(
              data.length,
              (index) => DataRow(
                cells: [
                  DataCell(
                      _buildRowText(text: data[index]['program'].toString())),
                  DataCell(
                      _buildRowText(text: data[index]['category'].toString())),
                  DataCell(
                      _buildRowText(text: data[index]['createdBy'].toString())),
                  DataCell(
                      _buildRowText(text: data[index]['email'].toString())),
                  const DataCell(
                    Icon(
                      Icons.visibility_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopMentors() {
    List<String> columns = [
      'Mentor Name',
      'Program',
      'Email',
      'Rating',
      'View',
    ];

    List<Map<String, dynamic>> data = [
      {
        'mentorName': 'John Kennedy',
        'program': 'Teaching Program',
        'email': 'johnk@gmail.com',
        'rating': '4.9',
      },
      {
        'mentorName': 'Jenifer Smith',
        'program': 'Teaching Program',
        'email': 'jenny@gmail.com',
        'rating': '4.8',
      },
      {
        'mentorName': 'Thomas Shelby',
        'program': 'Teaching Program',
        'email': 'thomas@gmail.com',
        'rating': '4.7',
      },
      {
        'mentorName': 'John Miller',
        'program': 'Teaching Program',
        'email': 'miller@gmail.com',
        'rating': '4.5',
      },
      {
        'mentorName': 'Jason Morgan',
        'program': 'Teaching Program',
        'email': 'jason@gmail.com',
        'rating': '4.8',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width > 600 ? 36 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF00AEBD),
                      Color(0xFF1D5BBF),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Top Mentors',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Image.asset(
                AppAssets.link,
                height: 12,
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: const Color(0xFFDFEDFF),
                ),
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 0,
            ),
          ),
          const SizedBox(height: 14),
          TableTemplateWidget(
            columns: columns,
            dataRow: List.generate(
              data.length,
              (index) => DataRow(
                cells: [
                  DataCell(
                    _buildRowText(text: data[index]['mentorName'].toString()),
                  ),
                  DataCell(
                    _buildRowText(text: data[index]['program'].toString()),
                  ),
                  DataCell(
                    _buildRowText(text: data[index]['email'].toString()),
                  ),
                  DataCell(
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFBB00),
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        _buildRowText(
                          text: data[index]['rating'].toString(),
                          color: const Color(0xFF1D5BBF),
                          isMedium: true,
                        ),
                      ],
                    ),
                  ),
                  const DataCell(
                    Icon(
                      Icons.visibility_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusMetrics() {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    List<List<int>> data = [
      [8, 6, 30],
      [30, 46, 46],
      [55, 28, 55],
      [28, 17, 28],
      [50, 4, 50],
      [40, 52, 52],
      [24, 18, 24],
      [30, 30, 30],
      [50, 3, 50],
      [20, 7, 20],
      [7, 4, 16],
      [50, 40, 50],
    ];
    List<Color> colors = [
      const Color(0xFFC7DEFF),
      const Color(0xFF7E9FD4),
      const Color(0xFF1D5BBF)
    ];
    List<String> legends = ['Completed', 'Active', 'All Programs'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width > 600 ? 36 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
      ),
      height: 416,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF00AEBD),
                      Color(0xFF1D5BBF),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Program Status Metrics',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              const DropDownWidget(
                items: ['Month', 'Year'],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 0,
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: 1200,
                      padding: const EdgeInsets.only(top: 12),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 60,
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  if (value % 10 == 0) {
                                    return Text(
                                      value.toInt().toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                                reservedSize: 24,
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    months[value.toInt()],
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  );
                                },
                                reservedSize: 24,
                              ),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(
                            border: const Border(
                              bottom: BorderSide(
                                color: Color(0xFFD9D9D9),
                              ),
                              left: BorderSide(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) {
                              return const FlLine(
                                color: Color(0xFFD9D9D9),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          barGroups: List.generate(
                            data.length,
                            (index) {
                              return BarChartGroupData(
                                x: index,
                                barsSpace: 5,
                                barRods: List.generate(
                                  data[index].length,
                                  (barIndex) => BarChartRodData(
                                    toY: data[index][barIndex].toDouble(),
                                    color: colors[barIndex],
                                    borderRadius: BorderRadius.zero,
                                    width: 15,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    legends.length,
                    (index) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          margin: EdgeInsets.only(
                            right: 6,
                            left: index != 0 ? 12 : 0,
                          ),
                          decoration: BoxDecoration(
                            color: colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          legends[index],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlannedPrograms(BuildContext context) {
    final List<Map<String, dynamic>> programList = [
      {'count': 327, 'name': 'Programs'},
      {'count': 120, 'name': 'Mentors'},
      {'count': 556, 'name': 'Mentees'},
    ];
    final List<Color> colors = [
      const Color(0xFFFFF4DE),
      const Color(0xFFC9F7F5),
      const Color(0xFFEEE5FF),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width > 600 ? 36 : 24,
      ),
      height: MediaQuery.of(context).size.width > 600 ? 416 : 342,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.06),
            offset: const Offset(3.75, 3.75),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF00AEBD),
                      Color(0xFF1D5BBF),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Planned Programs',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: const Color(0xFFDFEDFF),
                ),
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Divider(
              color: Color(0xFFD9D9D9),
              height: 0,
            ),
          ),

          const SizedBox(height: 14),

          // Program List
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: programList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: index != 0 ? 14 : 0),
                  child: Row(
                    children: [
                      Container(
                        height: 74,
                        width: 76,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: colors[index],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          programList[index]['count'].toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          programList[index]['name'] ?? 'Name',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TableTemplateWidget extends StatefulWidget {
  final List<String> columns;
  final List<DataRow> dataRow;

  const TableTemplateWidget({
    super.key,
    required this.columns,
    required this.dataRow,
  });

  @override
  State<TableTemplateWidget> createState() => _TableTemplateWidgetState();
}

class _TableTemplateWidgetState extends State<TableTemplateWidget> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _scrollController,
      thumbColor: Colors.black,
      trackColor: const Color(0xFFD9D9D9),
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 4,
      radius: const Radius.circular(4),
      trackRadius: Radius.zero,
      trackBorderColor: const Color(0xFFD9D9D9),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: DataTable(
              headingRowHeight: 60,
              dividerThickness: 0.2,
              border: const TableBorder(
                horizontalInside: BorderSide(color: Color(0xFFD9D9D9)),
              ),
              decoration: BoxDecoration(
                border: Border.all(color:const Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(8),
              ),
              headingRowColor: const WidgetStatePropertyAll(Color(0xFFD9E4F2)),
              columns: widget.columns
                  .map((col) => _buildDataColumn(text: col))
                  .toList(),
              rows: widget.dataRow,
            ),
          ),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn({required String text}) {
    return DataColumn(
      label: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
