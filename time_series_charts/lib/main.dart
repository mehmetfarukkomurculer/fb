import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_series_charts/screens/stock_detail_screen.dart';
import 'package:time_series_charts/screens/tab_bars/chart_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('tr_TR', null).then((_) {
    runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: StockDetailScreen(
          stockName: 'THYAO',
        ));
  }
}
