import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:time_series_charts/controllers/stocks_controller.dart';
import 'package:time_series_charts/models/historic_datas.dart';

import '../models/historic_data_model.dart';

Future<void> fetchHistoricData(String stockName) async {
  print('Fetching');
  List<dynamic> responseHistoricData = [];
  Map<DateTime, double> priceDataMap = {};
  //List<FinancialDataModel> financialHistoricData = [];
  final _stocksController = Get.put(StocksController());
  try {
    _stocksController.isHistoricDataFetching.value = true;
    var response = await http.get(
      Uri.parse('https://dev-avf06qq21xul7cp.api.raw-labs.com/mock/json-api'),
    );
    if (response.statusCode == 200) {
      responseHistoricData = jsonDecode(response.body);
      var jsonHistoricData = responseHistoricData[0];

      var historicClosePrice =
          jsonHistoricData['indicators']['quote'][0]['close'];
      //var historicOpenPrice =
      //jsonHistoricData['indicators']['quote'][0]['open'];
      //var historicLowPrice = jsonHistoricData['indicators']['quote'][0]['low'];
      //var historicHighPrice =
      //jsonHistoricData['indicators']['quote'][0]['high'];

      var historicTimeStamps = jsonHistoricData['timestamp'];

      for (int i = 0; i < historicTimeStamps.length; i++) {
        DateTime date =
            DateTime.fromMillisecondsSinceEpoch(historicTimeStamps[i] * 1000);
        if (historicClosePrice[i] != null) {
          priceDataMap[date] = historicClosePrice[i];
        }

        /*if (historicLowPrice[i] != null &&
            historicHighPrice[i] != null &&
            historicOpenPrice[i] != null &&
            historicClosePrice[i] != null) {
          financialHistoricData.add(
            FinancialDataModel(
              date: date,
              low: historicLowPrice[i],
              high: historicHighPrice[i],
              open: historicOpenPrice[i],
              close: historicClosePrice[i],
            ),
          );
        }*/
      }
    } else {
      throw Exception('Failed to fetch data');
    }
    _stocksController.isHistoricDataFetching.value = false;
  } catch (e) {
    print(e);
    _stocksController.isHistoricDataFetching.value = false;
  }
  List<HistoricData> historicData = priceDataMap.entries.map((entry) {
    return HistoricData(entry.key, entry.value);
  }).toList();
  print('historicData $historicData');
  /*------------------------------------------------------------------------------------------ */

  print('Fetching daily data');
  List<dynamic> responseDailyData = [];
  Map<DateTime, double> priceDailyDataMap = {};
  //List<FinancialDataModel> financialData = [];
  try {
    _stocksController.isDailyDataFetching.value = true;
    var response = await http.get(
      Uri.parse('https://dev-avf06qq21xul7cp.api.raw-labs.com/mock/2'),
    );
    if (response.statusCode == 200) {
      responseDailyData = jsonDecode(response.body);
      var jsonDailyData = responseDailyData[0];

      var dailyClosePrice = jsonDailyData['indicators']['quote'][0]['close'];
      //var dailyOpenPrice = jsonDailyData['indicators']['quote'][0]['open'];
      //var dailyLowPrice = jsonDailyData['indicators']['quote'][0]['low'];
      //var dailyHighPrice = jsonDailyData['indicators']['quote'][0]['high'];
      var historicTimeStamps = jsonDailyData['timestamp'];

      for (int i = 0; i < historicTimeStamps.length; i++) {
        DateTime date =
            DateTime.fromMillisecondsSinceEpoch(historicTimeStamps[i] * 1000)
                .add(
          Duration(hours: 3),
        );
        if (dailyClosePrice[i] != null) {
          priceDailyDataMap[date] = dailyClosePrice[i];
        }

        /*if (dailyLowPrice[i] != null &&
            dailyHighPrice[i] != null &&
            dailyOpenPrice[i] != null &&
            dailyClosePrice[i] != null) {
          financialData.add(
            FinancialDataModel(
              date: date,
              low: dailyLowPrice[i],
              high: dailyHighPrice[i],
              open: dailyOpenPrice[i],
              close: dailyClosePrice[i],
            ),
          );
        }*/
      }
    } else {
      throw Exception('Failed to fetch daily data');
    }
    _stocksController.isDailyDataFetching.value = false;
  } catch (e) {
    print(e);
    _stocksController.isDailyDataFetching.value = false;
  }
  List<HistoricData> dailyData = priceDailyDataMap.entries.map((entry) {
    return HistoricData(entry.key, entry.value);
  }).toList();

  final historicDatas = HistoricDatas(
    name: stockName,
    historicData: historicData,
    dailyData: dailyData,
  );
  _stocksController.addNewFetchedHistoricData(historicDatas);

  /*final financialDataWithStockName = FinancialDataModelWithStockName(
      stockName: stockName,
      dailyFinancialData: financialData,
      historicFinancialData: financialHistoricData);
  _stocksController.addNewFinancialData(financialDataWithStockName);*/
}

class FinancialDataModel {
  DateTime date;
  double low;
  double high;
  double open;
  double close;

  FinancialDataModel(
      {required this.date,
      required this.low,
      required this.high,
      required this.open,
      required this.close});
}

class FinancialDataModelWithStockName {
  String stockName;
  List<FinancialDataModel>? dailyFinancialData;
  List<FinancialDataModel>? historicFinancialData;
  FinancialDataModelWithStockName(
      {required this.stockName,
      this.dailyFinancialData,
      this.historicFinancialData});
}
