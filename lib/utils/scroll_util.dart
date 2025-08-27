import 'package:flutter/widgets.dart';

(double, double) getWidgetGlobalPosition(GlobalKey key) {
  /* 
    ウィジェットの画面上の位置（左上）を取得
    return (x, y)
  */
  final ctx = key.currentContext;
  if (ctx == null) return (-1, -1);

  final box = ctx.findRenderObject() as RenderBox;
  final topLeft = box.localToGlobal(Offset.zero);
  return (topLeft.dx, topLeft.dy);
}
