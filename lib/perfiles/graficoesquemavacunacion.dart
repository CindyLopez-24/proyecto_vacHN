import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GraficoEsquemasVac extends StatefulWidget {
  const GraficoEsquemasVac({super.key});

  @override
  State<GraficoEsquemasVac> createState() => _GraficoEsquemasVac();
}

class _GraficoEsquemasVac extends State<GraficoEsquemasVac> {
  Map<String, dynamic>? extra_;
  List<BarChartGroupData> barras = [];
  String? clave;

  @override
  void initState() {
    super.initState();
    extra_ = GoRouter.of(context).state.extra as Map<String, dynamic>?;
    for (int i = 0; i < extra_?['vacunas'].length; i++) {
      clave = extra_!['vacunas'][i]['grupo'][0].keys.first;
      barras.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
                toY: extra_?['vacunas'][i]['grupo'][0][clave]['completadas']
                    .toDouble(),
                color: Colors.blue,
                width: 17),
            BarChartRodData(
                toY: extra_?['vacunas'][i]['grupo'][0][clave]['pendientes']
                    .toDouble(),
                color: Colors.red,
                width: 17),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Esquemas de Vacunación'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: extra_!['vacunas'].length * 170.toDouble(),
            child: BarChart(
              BarChartData(
                barGroups: barras,
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        // Mostrar sólo valores enteros
                        if (value % 1 == 0) {
                          return Text(value.toInt().toString());
                        }
                        return const SizedBox.shrink();
                      },
                      interval: 1, // Intervalo entre divisiones (sólo enteros)
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        int index = value.toInt();
                        if (index < extra_!['vacunas'].length) {
                          return Text(
                            extra_!['vacunas'][index]['nombre'],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipRoundedRadius: 8,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        'Completado: ${rod.toY}\nPendiente: ${(rod.toY).toStringAsFixed(1)}',
                        const TextStyle(color: Colors.blue),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 83, 178, 247),
        onPressed: () {
          context.pushReplacement('/perfilvacunas');
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
