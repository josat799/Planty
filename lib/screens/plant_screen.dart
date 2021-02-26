import 'package:flutter/material.dart';
import 'package:planty/models/plant_model.dart';

class PlantScreen extends StatelessWidget {
  Plant plant;

  PlantScreen(this.plant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      "Amount of water: ${plant.amountOfWater.toInt().toString()} ml"),
                  Text(
                    "Next time to water: ${plant.nextTimeToWater}",),

                ],
              ),
              Text("Last time watered: ${plant.lastWatered}"),
              Text("Recommended watering time: ${plant.recommendedWateringTime.inDays}"),
              Image.network(plant.picture),
              Text("Description"),
              Text(
                plant.description,
                softWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
