import 'package:flutter/material.dart';

import 'data_center.dart';

class SheetScreen extends StatefulWidget {
  const SheetScreen({super.key});

  @override
  State<SheetScreen> createState() => _SheetScreenState();
}

class _SheetScreenState extends State<SheetScreen> {
  var pageCon = PageController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: dc,
      builder: (ctx, child) {
        return DraggableScrollableSheet(
          minChildSize: 0.2,
          maxChildSize: 0.95,
          initialChildSize: 0.2,
          snap: true,
          builder: (context, scrollCon) {
            return Container(
              child: SingleChildScrollView(
                controller: scrollCon,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: Colors.cyanAccent),
                  child: PageView(
                    controller: pageCon,
                    children: [
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
