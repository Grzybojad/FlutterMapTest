import 'package:flutter/material.dart';
import 'package:maps_demo/building.dart';

class InfoCard extends StatefulWidget {
  InfoCardDialog infoCard;

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool _showingInfoCard = false;

  showInfoCard(Building building) {
    setState(() {
      _showingInfoCard = true;
      widget.infoCard = InfoCardDialog.fromBuilding(building, hideInfoCard);
    });
  }

  hideInfoCard() {
    setState(() {
      _showingInfoCard = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _showingInfoCard,
      child: Align(
        alignment: Alignment.center,
        child: widget.infoCard,
      ),
    );
  }
}


class InfoCardDialog extends StatelessWidget {
  String header;
  String description;
  Function onClose;

  final headerStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);

  InfoCardDialog({this.header, this.description});
  InfoCardDialog.fromBuilding(Building building, this.onClose) {
    this.header = building.name;
    this.description = building.departments.join("\n");
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(header, style: headerStyle),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: onClose,
          child: Text("Ok"),
        ),
      ],
    );
  }
}
