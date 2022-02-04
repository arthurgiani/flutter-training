import 'package:flutter/material.dart';

class ListViewConstraintsPage extends StatefulWidget {
  const ListViewConstraintsPage({Key? key}) : super(key: key);

  @override
  _ListViewConstraintsPageState createState() =>
      _ListViewConstraintsPageState();
}

class _ListViewConstraintsPageState extends State<ListViewConstraintsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Constraints Page'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 8);
              },
              itemCount: 100,
              itemBuilder: (context, index) {
                return Container(
                  width: 50,
                  child: const Center(child: Text('test')),
                  color: Colors.red,
                );
              },
            ),
          ),
          const SizedBox(height: 100),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: 100,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: const Center(child: Text('test')),
                  color: Colors.red,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
