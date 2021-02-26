import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planty/models/plant_model.dart';

class PlantCard extends StatelessWidget {
  Plant plant;

  PlantCard(this.plant);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              child: Image.network(
                plant.picture,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 100,
                    child: Text(plant.name)),
                SizedBox(
                  width: 8,
                ),
                Text(
                    "Watered: ${plant.getDaysSince().inDays} days ago"),
              ],
            ),
            Spacer(),
            Container(
              width: 125,
              child: Column(
                children: [
                  Text("Next time to water"),
                  Text(
                      "${plant.getDaysLeft().inDays} days"),
                ],
              ),
            ),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.tint,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
