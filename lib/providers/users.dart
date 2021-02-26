import 'package:flutter/foundation.dart';
import 'package:planty/models/user_model.dart';

class Users with ChangeNotifier {
  List<User> _items = [
    User(
        name: "Josef Atoui",
        username: "josat",
        profilePicture:
            "https://scontent-arn2-1.xx.fbcdn.net/v/t1.0-9/73388489_2539406379431769_8614658395145764864_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=MqEV3Gh6gq4AX_GkIvB&_nc_ht=scontent-arn2-1.xx&oh=b65f206e0bde95308ae5c13a87f95117&oe=5FE9E103"),
    User(
        name: "Jakob Duvaldt",
        username: "jakdu",
        profilePicture:
            "https://scontent-arn2-2.xx.fbcdn.net/v/t1.0-9/12115533_1230320730326864_7852322655230177397_n.jpg?_nc_cat=108&ccb=2&_nc_sid=09cbfe&_nc_ohc=ONE9rk4ygKwAX-ECbAM&_nc_ht=scontent-arn2-2.xx&oh=42bff5d345f8df3da874c137cd16fb7c&oe=5FE79ECB"),
    User(
        name: "Albert Einstein",
        username: "albei",
        profilePicture:
        ""),
    User(
        name: "Plantagen",
        username: "plantagen",
        profilePicture:
        "https://torp.se/globalassets/thon-property-ab-se/center-oversikt/torp-kopcentrum/logo/plantagen.jpg"),
  ];

  List<User> get items => [..._items];

  User getCurrentUser() => _items.first;

  User getUserByUserId(String userId) {
    return _items.firstWhere((element) => element.username == userId);
  }
}
