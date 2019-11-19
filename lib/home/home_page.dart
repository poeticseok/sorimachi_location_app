import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home')),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[Red(), Green(), Blue()]
      ),
      bottomNavigationBar: Container(
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.card_travel), text: '빨강'),
            Tab(icon: Icon(Icons.donut_small), text: '초록'),
            Tab(icon: Icon(Icons.table_chart), text: '파랑'),
          ],
        ),
        color: Colors.blueGrey,
      ),
    );
  }
}

class Red extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.red);
  }
}

class Green extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.green);
  }
}

class Blue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.blue);
  }
}