import 'dart:math';

import 'package:flutter/material.dart';
import 'package:no/data_center.dart';

class Clock extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width/2;
    double centerY = size.height/2;
    var center = Offset(centerX, centerY);

    double angle = (dc.nowSec / 60) * 2 * pi -  pi/2;
    double s = sin(angle);
    double c = cos(angle);
    double handLength = centerX * 0.8;

    // print("now sin is $s");
    // print("now cos is $c");
    // print(angle);

    canvas.drawLine(//秒針
        Offset(centerX, centerY),
        Offset(centerX+c*handLength,centerY+s*handLength),
        Paint()..strokeWidth = 2
    );

    //秒針尖端
    Path path = Path();
    path.moveTo(centerX+c*handLength*1.1, centerY+s*handLength*1.1);//tip
    path.lineTo(centerX+cos(((dc.nowSec-0.5) / 60) * 2 * pi -  pi/2)*(handLength*0.9), centerY+sin(((dc.nowSec-0.5) / 60) * 2 * pi -  pi/2)*(handLength*0.9));//左下角
    path.lineTo(centerX+cos(((dc.nowSec+0.5) / 60) * 2 * pi -  pi/2)*(handLength*0.9), centerY+sin(((dc.nowSec+0.5 )/ 60) * 2 * pi -  pi/2)*(handLength*0.9));//右下角
    path.lineTo(centerX+c*handLength*1.1, centerY+s*handLength*1.1);//tip
    path.close();
    canvas.drawPath(
        path,
        Paint()..strokeWidth = 2..style = PaintingStyle.fill
    );

    canvas.drawCircle(//時中外圈
        center,
        centerX,
        Paint()
          ..strokeWidth = 5
          ..style = PaintingStyle.stroke
    );

    canvas.drawCircle(Offset(centerX, centerY), 2,
      Paint()
        ..color = Colors.black
    );

    //時中數字
    for(int i = 1 ;i<=12;i++){
      double textAngle = i /12 *2*pi-pi/2;
      var ss = sin(textAngle);
      var cc = cos(textAngle);
      final textPainter = TextPainter(
        text:TextSpan(
          text: "$i",
          style: TextStyle(
            color: Colors.black
          )
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas,
          Offset(centerX+cc*handLength-textPainter.width/2, centerY+ss*handLength-textPainter.height/2)
      );
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}