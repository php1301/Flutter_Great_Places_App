import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './maps_screen.dart';
import '../providers/great_places.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatePlaces>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            selectedPlace.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          FlatButton(
            child: Text('View on the Map'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MapsScreen(
                    initialLocation: selectedPlace.location,
                    isSelecting: false,
                  ), // ko can isSelecting lam
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
