import 'package:flutter/foundation.dart';
import 'package:planty/models/feed_post_model.dart';

class Feeds with ChangeNotifier {
  List<FeedPost> _items = [
    FeedPost(author: "jakdu", description: "My second plant :)", images: [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNLwXfMv_bcVOx_hePFFhOTTLEJY9kp6xLE5KK6tAKQNmo11ezj2CNL_qzTx8sf5eirQtbLHQ&usqp=CAc"
    ], likes: ['josat']),
    FeedPost(author: "josat", description: "My first plant :)", images: [
      "https://www.blomsterlandet.se/db70f517/globalassets/catalog-images/7/zebraskold-mps-17cm-60-70cm/8c0314c0cf13da9499865ada9fc2dbad5.jpg"
    ]),
    FeedPost(author: "plantagen", description: "See our new plants in stock", images: [
      "https://eu003.leafletcdns.com/se/data/33/3843/0_s.webp?t=1568269818"
    ]),
    FeedPost(author: "albei", description: "My first plant :)", images: [
      "https://www.stylist.co.uk/images/app/uploads/2019/03/22172018/retro-houseplant-trends-plants-interiors-2019-crop-1553275284-1600x1067.jpg?w=1640&h=1&fit=max&auto=format%2Ccompress",
    ]),
    FeedPost(author: "jakdu", description: "My first plant :)", images: [
      "http://nosolosoftware.com/files/2018/02/IMG_20180124_233755.jpg",
    ], comments: [
      Comment(author: "josat", text: "Vad fin!"),
      Comment(author: "albei", text: "Superfin!"),
      Comment(author: "jakdu", text: "Tack!"),
    ]),
  ];

  List<FeedPost> get items => [..._items];
}
