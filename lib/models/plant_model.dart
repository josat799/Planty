import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Plant {
  DateFormat format = DateFormat.yMMMd();

  String picture;
  String name;
  String description;
  double amountOfWater;
  String lastWatered;
  String nextTimeToWater;
  Duration recommendedWateringTime;

  void updateWatering() {
    lastWatered = format.format(DateTime.now());
    nextTimeToWater = format.format(format.parse(lastWatered).add(Duration(days: 7)));
  }

  Duration getDaysLeft() {
    return format.parse(nextTimeToWater).difference(format.parse(lastWatered));
  }
  Duration getDaysSince() {
    print(lastWatered);
    return format.parse(lastWatered).difference(DateTime.now());
  }

  Plant({
    @required this.picture,
    @required this.name,
    @required this.description,
    @required this.amountOfWater,
    @required this.recommendedWateringTime,
    this.lastWatered,
  });
}
