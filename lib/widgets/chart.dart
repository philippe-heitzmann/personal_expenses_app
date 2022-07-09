import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(5),
        child: Container(
            height: 50,
            width: double.infinity,
            child: Column(
              children: [Text('Test')],
            )));
  }
}
