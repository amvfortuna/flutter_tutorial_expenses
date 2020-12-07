import 'package:flutter/material.dart';

import './transaction_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          TransactionCard(name: 'Cheesy feet rubber cheese mascarpone.', amount: '500', date: 'Dec 20',),
          TransactionCard(name: 'Sample 2', amount: '1000', date: 'Dec 21',),
          TransactionCard(name: 'Sample 3', amount: '1500', date: 'Dec 22',),
          TransactionCard(name: 'Sample 4', amount: '2000', date: 'Dec 23',),
          TransactionCard(name: 'Sample 5', amount: '2500', date: 'Dec 24',),
        ],
      ),
    );
  }
}
