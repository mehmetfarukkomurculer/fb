import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:time_series_charts/components/ui/button.dart';
import 'package:time_series_charts/controllers/stocks_controller.dart';
import 'package:time_series_charts/models/historic_datas.dart';
import 'package:time_series_charts/models/historic_data_model.dart';
import '../../services/fetch_historic_data.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({required this.stockName});
  final String stockName;

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final StocksController _stocksController = Get.put(StocksController());
  late TooltipBehavior _tooltipBehavior;
  String filter = '1G';
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);

    if (!_isDataAlreadyFetched()) {
      // If data is not fetched, then fetch it
      fetchHistoricData(widget.stockName);
    }
  }

  bool _isDataAlreadyFetched() {
    // Get the list of fetched historic datas
    List<HistoricDatas> fetchedDataList =
        _stocksController.fetchedHistoricDatas.value;

    // Check if there exists a data with the given stockName
    bool isDataAlreadyFetched =
        fetchedDataList.any((data) => data.name == widget.stockName);

    return isDataAlreadyFetched;
  }

  @override
  Widget build(BuildContext context) {
    const LinearGradient gradientColors = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff7ABA78),
          Color(0xff6da76c),
          Color(0xff619460),
          Color(0xff558254),
          Color(0xff496f48),
          Color(0xff3d5d3c),
          Color(0xff304a30),
          Color(0xff243724),
          Color(0xff182518),
          Color(0xff0c120c),
        ]);
    return Obx(
      () => _stocksController.isHistoricDataFetching.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Obx(
                    () {
                      final fetchedData =
                          _stocksController.fetchedHistoricDatas.value;
                      List<HistoricData>? chartData;
                      if (filter == '1G') {
                        chartData = fetchedData
                            .firstWhere(
                              (data) => data.name == widget.stockName,
                              orElse: () => HistoricDatas(
                                  name: widget.stockName, historicData: []),
                            )
                            .dailyData;
                      } else if (filter == '1H') {
                        var allHistoricData = fetchedData
                            .firstWhere(
                              (data) => data.name == widget.stockName,
                              orElse: () => HistoricDatas(
                                  name: widget.stockName, historicData: []),
                            )
                            .historicData;
                        if (allHistoricData != null) {
                          chartData = allHistoricData
                              .where(
                                (data) => data.date.isAfter(
                                  DateTime.now().subtract(
                                    const Duration(days: 8),
                                  ),
                                ),
                              )
                              .toList();
                        }
                      } else if (filter == '1A') {
                        var allHistoricData = fetchedData
                            .firstWhere(
                              (data) => data.name == widget.stockName,
                              orElse: () => HistoricDatas(
                                  name: widget.stockName, historicData: []),
                            )
                            .historicData;
                        if (allHistoricData != null) {
                          chartData = allHistoricData
                              .where(
                                (data) => data.date.isAfter(
                                  DateTime.now().subtract(
                                    const Duration(days: 30),
                                  ),
                                ),
                              )
                              .toList();
                        }
                      } else if (filter == '6A') {
                        var allHistoricData = fetchedData
                            .firstWhere(
                              (data) => data.name == widget.stockName,
                              orElse: () => HistoricDatas(
                                  name: widget.stockName, historicData: []),
                            )
                            .historicData;
                        if (allHistoricData != null) {
                          chartData = allHistoricData
                              .where(
                                (data) => data.date.isAfter(
                                  DateTime.now().subtract(
                                    const Duration(days: 180),
                                  ),
                                ),
                              )
                              .toList();
                        }
                      } else if (filter == '1Y') {
                        var allHistoricData = fetchedData
                            .firstWhere(
                              (data) => data.name == widget.stockName,
                              orElse: () => HistoricDatas(
                                  name: widget.stockName, historicData: []),
                            )
                            .historicData;
                        if (allHistoricData != null) {
                          chartData = allHistoricData
                              .where(
                                (data) => data.date.isAfter(
                                  DateTime.now().subtract(
                                    const Duration(days: 365),
                                  ),
                                ),
                              )
                              .toList();
                        }
                      } else if (filter == '5Y') {
                        var allHistoricData = fetchedData
                            .firstWhere(
                              (data) => data.name == widget.stockName,
                              orElse: () => HistoricDatas(
                                  name: widget.stockName, historicData: []),
                            )
                            .historicData;
                        if (allHistoricData != null) {
                          chartData = allHistoricData
                              .where(
                                (data) => data.date.isAfter(
                                  DateTime.now().subtract(
                                    const Duration(days: 1825),
                                  ),
                                ),
                              )
                              .toList();
                        }
                      }

                      return SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: DateTimeAxis(
                          maximumLabels: 5,
                          //isVisible: false,
                          axisLine: const AxisLine(color: Colors.transparent),
                          majorTickLines: const MajorTickLines(
                            width: 0,
                          ),
                          majorGridLines: const MajorGridLines(width: 0),
                          dateFormat: filter == '1G'
                              ? DateFormat.Hm('tr_TR')
                              : DateFormat.yMMMMd('tr_TR'),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 10,
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          //initialVisibleMinimum: 100, // başlangıç value si
                          majorTickLines: const MajorTickLines(
                            width: 0,
                          ),
                          //minorGridLines: MinorGridLines(width: 0),
                          //edgeLabelPlacement: EdgeLabelPlacement.shift,
                          //tickPosition: TickPosition.inside,
                          //anchorRangeToVisiblePoints: false,
                          axisLine: const AxisLine(color: Colors.transparent),
                          opposedPosition: true,
                          //isVisible: false,
                          majorGridLines: const MajorGridLines(width: 0),
                          numberFormat: NumberFormat.simpleCurrency(
                            name: '₺',
                            decimalDigits: 2,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 10,
                          ),
                        ),
                        /*title: ChartTitle(
                        text: widget.stockName,
                        textStyle: const TextStyle(
                          color: Colors.green,
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),*/
                        tooltipBehavior: _tooltipBehavior,
                        series: <CartesianSeries>[
                          AreaSeries<HistoricData, DateTime>(
                            animationDuration: 400,
                            borderColor: Color(0xff7aba78),
                            //gradient: gradientColors,
                            color: Colors.transparent,
                            name: 'Fiyat',
                            dataSource: chartData,
                            xValueMapper: (HistoricData data, _) => data.date,
                            yValueMapper: (HistoricData data, _) => data.price,
                            // Customize line appearance
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        buttonTitle: '1G',
                        onTap: () {
                          setState(() {
                            filter = '1G';
                          });
                        },
                        color: filter == '1G'
                            ? const Color(0xff3d5d3c)
                            : Colors.transparent,
                        textStyle: TextStyle(
                          color: filter == '1G' ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        buttonTitle: '1H',
                        onTap: () {
                          setState(() {
                            filter = '1H';
                          });
                        },
                        color: filter == '1H'
                            ? const Color(0xff3d5d3c)
                            : Colors.transparent,
                        textStyle: TextStyle(
                          color: filter == '1H' ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        buttonTitle: '1A',
                        onTap: () {
                          setState(() {
                            filter = '1A';
                          });
                        },
                        color: filter == '1A'
                            ? const Color(0xff3d5d3c)
                            : Colors.transparent,
                        textStyle: TextStyle(
                          color: filter == '1A' ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        buttonTitle: '6A',
                        onTap: () {
                          setState(() {
                            filter = '6A';
                          });
                        },
                        color: filter == '6A'
                            ? const Color(0xff3d5d3c)
                            : Colors.transparent,
                        textStyle: TextStyle(
                          color: filter == '6A' ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        buttonTitle: '1Y',
                        onTap: () {
                          setState(() {
                            filter = '1Y';
                          });
                        },
                        color: filter == '1Y'
                            ? const Color(0xff3d5d3c)
                            : Colors.transparent,
                        textStyle: TextStyle(
                          color: filter == '1Y' ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        buttonTitle: '5Y',
                        onTap: () {
                          setState(() {
                            filter = '5Y';
                          });
                        },
                        color: filter == '5Y'
                            ? const Color(0xff3d5d3c)
                            : Colors.transparent,
                        textStyle: TextStyle(
                          color: filter == '5Y' ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
    );
  }
}
