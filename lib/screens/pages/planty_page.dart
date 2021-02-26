import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:planty/models/user_model.dart';
import 'package:planty/providers/feeds.dart';
import 'package:planty/providers/users.dart';
import 'file:///C:/Users/josef/Documents/tdde02/planty/lib/widgets/feed/feed_post.dart';
import 'package:planty/widgets/page_widget.dart';
import 'package:provider/provider.dart';

class PlantyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context, listen: false);

    return PageWidget(
      child: Consumer<Feeds>(
        builder: (BuildContext context, Feeds value, _) => ListView.builder(
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: FeedPost(users.getUserByUserId(value.items.elementAt(i).author), value.items.elementAt(i)),
          ),
          itemCount: value.items.length,
        ),
      ),
    );
  }
}
