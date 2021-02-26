import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalGoalMessage extends StatefulWidget {

  @override
  _GlobalGoalMessageState createState() => _GlobalGoalMessageState();
}

class _GlobalGoalMessageState extends State<GlobalGoalMessage> {
  Map<String, List<String>> _messages = {
    "15.1": [
      "CONSERVE AND RESTORE TERRESTRIAL AND FRESHWATER ECOSYSTEMS",
      "By 2020, ensure the conservation, restoration and sustainable use of terrestrial and inland freshwater ecosystems and their services, in particular forests, wetlands, mountains and drylands, in line with obligations under international agreements."
    ],
    "15.2": [
      "END DEFORESTATION AND RESTORE DEGRADED FORESTS",
      "By 2020, promote the implementation of sustainable management of all types of forests, halt deforestation, restore degraded forests and substantially increase afforestation and reforestation globally."
    ],
    "15.3": [
      "END DESERTIFICATION AND RESTORE DEGRADED LAND",
      "By 2030, combat desertification, restore degraded land and soil, including land affected by desertification, drought and floods, and strive to achieve a land degradation-neutral world."
    ],
    "15.4": [
      "ENSURE CONSERVATION OF MOUNTAIN ECOSYSTEMS",
      "By 2030, ensure the conservation of mountain ecosystems, including their biodiversity, in order to enhance their capacity to provide benefits that are essential for sustainable development."
    ],
    "15.5": [
      "PROTECT BIODIVERSITY AND NATURAL HABITATS",
      "Take urgent and significant action to reduce the degradation of natural habitats, halt the loss of biodiversity and, by 2020, protect and prevent the extinction of threatened species."
    ],
    "15.6": [
      "PROMOTE ACCESS TO GENETIC RESOURCES AND FAIR SHARING OF THE BENEFITS",
      "Promote fair and equitable sharing of the benefits arising from the utilization of genetic resources and promote appropriate access to such resources, as internationally agreed."
    ],
    "15.7": [
      "ELIMINATE POACHING AND TRAFFICKING OF PROTECTED SPECIES",
      "Take urgent action to end poaching and trafficking of protected species of flora and fauna and address both demand and supply of illegal wildlife products."
    ],
    "15.8": [
      "PREVENT INVASIVE ALIEN SPECIES ON LAND AND IN WATER ECOSYSTEMS",
      "By 2020, introduce measures to prevent the introduction and significantly reduce the impact of invasive alien species on land and water ecosystems and control or eradicate the priority species."
    ],
    "15.9": [
      "INTEGRATE ECOSYSTEM AND BIODIVERSITY IN GOVERNMENTAL PLANNING",
      "By 2020, integrate ecosystem and biodiversity values into national and local planning, development processes, poverty reduction strategies and accounts."
    ],
    "15.A": [
      "INCREASE FINANCIAL RESOURCES TO CONSERVE AND SUSTAINABLY USE ECOSYSTEM AND BIODIVERSITY",
      "Mobilize and significantly increase financial resources from all sources to conserve and sustainably use biodiversity and ecosystems."
    ],
    "15.B": [
      "FINANCE AND INCENTIVIZE SUSTAINABLE FOREST MANAGEMENT",
      "Mobilize significant resources from all sources and at all levels to finance sustainable forest management and provide adequate incentives to developing countries to advance such management, including for conservation and reforestation."
    ],
    "15.C": [
      "COMBAT GLOBAL POACHING AND TRAFFICKING",
      "Enhance global support for efforts to combat poaching and trafficking of protected species, including by increasing the capacity of local communities to pursue sustainable livelihood opportunities."
    ],
  };

  String getRandomMessage() {
    return _messages.keys.elementAt(Random().nextInt(_messages.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    var messageKey = getRandomMessage();
    return AlertDialog(
      title: Text(_messages[messageKey].elementAt(0)),
      actions: [
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Dismiss"))
      ],
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Flexible(
                  child: Image.asset(
                      "assets/global_goals/GOAL_15_TARGET_${messageKey}.png")),
              SizedBox(
                width: 10,
              ),
              Flexible(child: Text(_messages[messageKey].elementAt(1))),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          GestureDetector(
            child: Text(
              "Läs mer här!",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            onTap: () => launch("https://www.globalgoals.org/15-life-on-land"),
          ),
        ],
      ),
    );
  }
}
