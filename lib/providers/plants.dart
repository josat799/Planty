import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:planty/models/plant_model.dart';

class Plants with ChangeNotifier {
  List<Plant> _items = [
    Plant(
      name: "Zebrasköld",
      description:
          "Växten har irriterande växtsaft och hela växten innehåller ämnen som är starkt irriterande, kan ge magbesvär vid förtäring. Placeras utom räckhåll för barn och husdjur som vill leka med eller tugga på växter. Trivs i ljust läge, undvik direkt sol. Vattnas då jorden torkat upp, ungefär en gång i veckan. Ge dem gärna en uppfriskande dusch då och då. När plantan blivit för stor för sin kruka kan den omplanteras och delas. Ge den en liten dos växtnäring två gånger i månaden från vår till höst",
      amountOfWater: 2,
      picture:
          "https://www.plantagen.se/dw/image/v2/BCMR_PRD/on/demandware.static/-/Sites-inriver-catalog/default/dwc3b56356/images/large/7058782365636(1).jpg?sh=618",
      recommendedWateringTime: Duration(days: 7),
      lastWatered: DateFormat.yMMMd().format(
        DateTime.now().subtract(
          Duration(days: 5),
        ),
      ),
    ),
  ];

  List<Plant> get items => [..._items];

  void updateItems() {
    _items.forEach((element) {
      element.updateWatering();
    });
  }
}
