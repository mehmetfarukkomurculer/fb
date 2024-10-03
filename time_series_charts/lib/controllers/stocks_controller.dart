import 'package:get/get.dart';
import 'package:time_series_charts/models/historic_datas.dart';
import 'package:time_series_charts/services/fetch_historic_data.dart';

class StocksController extends GetxController {
  var isHistoricDataFetching = false.obs;
  var isDailyDataFetching = false.obs;
  Rx<List<HistoricDatas>> fetchedHistoricDatas = Rx<List<HistoricDatas>>([]);

  Rx<List<FinancialDataModelWithStockName>> fetchedFinancialData =
      Rx<List<FinancialDataModelWithStockName>>([]);

  void addNewFetchedHistoricData(HistoricDatas historicDatas) {
    final newList = List<HistoricDatas>.from(fetchedHistoricDatas.value);
    newList.add(historicDatas);
    fetchedHistoricDatas.value = newList;
  }

  void addNewFinancialData(FinancialDataModelWithStockName financialData) {
    final newList =
        List<FinancialDataModelWithStockName>.from(fetchedFinancialData.value);
    newList.add(financialData);
    fetchedFinancialData.value = newList;
  }
}
