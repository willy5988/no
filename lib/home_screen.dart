import 'package:flutter/material.dart';
import 'package:no/clock.dart';
import 'package:no/sheet_screen.dart';

import 'data_center.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: dc,
      builder: (ctx, child) {
        String min = (dc.nowSec ~/ 60).toString().padLeft(2, '0');
        String sec = (dc.nowSec % 60).toString().padLeft(2, '0');
        return Material(
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text("Tomato Bo"),
                  elevation: 5,
                  actions: [Icon(Icons.stacked_bar_chart)],
                ),
                body: Center(
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: Clock(),
                        size: Size(200, 300),
                      ),
                      Text("鬧鐘"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("$min:$sec"),
                      ElevatedButton(
                        onPressed: () {
                          dc.nowSec += 1;
                          print(dc.nowSec);
                          dc.upDate();
                        },
                        child: Text("+1"),
                      ),
                    ],
                  ),
                ),
              ),
              SheetScreen(),
            ],
          ),
        );
      },
    );
  }
}
