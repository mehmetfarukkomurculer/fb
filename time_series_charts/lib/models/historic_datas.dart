import 'historic_data_model.dart';

class HistoricDatas {
  final String name;
  final List<HistoricData>? historicData;
  final List<HistoricData>? dailyData;
  HistoricDatas({required this.name, this.historicData, this.dailyData});
}
