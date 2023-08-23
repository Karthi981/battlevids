import 'package:flutter/material.dart';

class ResponsiveGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive GridView'),
      ),
      body: GridView.builder(
        itemCount: 20, // Replace with your actual item count
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            color: Colors.blue,
            height: 150,
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

