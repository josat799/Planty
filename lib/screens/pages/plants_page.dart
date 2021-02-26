import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:planty/providers/plants.dart';
import 'package:planty/widgets/page_widget.dart';
import 'package:planty/widgets/plant.dart';
import 'package:provider/provider.dart';

import '../plant_screen.dart';

class PlantsPage extends StatefulWidget {
  @override
  _PlantsPageState createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Plants>(context, listen: false).updateItems();
    return PageWidget(
      child: Consumer<Plants>(
        builder: (context, value, _) => ListView.builder(
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => PlantScreen(value.items.elementAt(i)))),
              child: PlantCard(value.items.elementAt(i)),
            ),
          ),
          itemCount: value.items.length,
        ),
      ),
    );
  }
}
