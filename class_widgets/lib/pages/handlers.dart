import 'package:flutter/material.dart';

abstract class MarketPlaceWidgetHandler {
  Widget render(BuildContext context, String label);
}

abstract class MarketPlaceWidgetBaseHandler extends MarketPlaceWidgetHandler {
  final MarketPlaceWidgetHandler next;

  MarketPlaceWidgetBaseHandler(this.next);
}

class NutriWidget extends MarketPlaceWidgetBaseHandler {
  NutriWidget({required MarketPlaceWidgetHandler next}) : super(next);

  @override
  Widget render(BuildContext context, String label) {
    if (label == 'nutri') {
      return Container(
        height: 100,
        width: 100,
        color: Colors.red,
      );
    } else {
      return next.render(context, label);
    }
  }
}

class OtherWidget extends MarketPlaceWidgetBaseHandler {
  OtherWidget({required MarketPlaceWidgetHandler next}) : super(next);

  @override
  Widget render(BuildContext context, String label) {
    if (label == 'other') {
      return Container(
        height: 100,
        width: 100,
        color: Colors.green,
      );
    } else {
      return next.render(context, label);
    }
  }
}

class AnotherWidget extends MarketPlaceWidgetHandler {
  @override
  Widget render(BuildContext context, String label) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.black,
    );
  }
}

