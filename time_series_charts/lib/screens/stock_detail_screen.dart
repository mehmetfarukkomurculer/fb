import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_series_charts/screens/tab_bars/chart_screen.dart';
import 'package:time_series_charts/screens/tab_bars/forum_screen.dart';
import 'package:time_series_charts/screens/tab_bars/news_screen.dart';

class StockDetailScreen extends StatefulWidget {
  StockDetailScreen({required this.stockName});
  final String stockName;

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            widget.stockName,
            style: const TextStyle(
              color: const Color(0xff0c120c),
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            dividerColor: Color(0xff3d5d3c),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              color: Color(0xff3d5d3c),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: 'Grafik',
              ),
              Tab(
                text: 'Haberler',
              ),
              Tab(
                text: 'Forum',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChartScreen(stockName: widget.stockName),
            NewsScreen(),
            const ForumScreen(),
          ],
        ),
      ),
    );
  }
}
