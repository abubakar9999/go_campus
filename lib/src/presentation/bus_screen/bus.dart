import 'package:flutter/material.dart';

import 'package:go_campus/src/presentation/bus_screen/map.dart'; // update path based on your structure

class BusLocationScreen extends StatelessWidget {
  final List<String> routes = ["Route 1", "Route 2", "Route 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bus Routes"), backgroundColor: Colors.indigo),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.directions_bus, color: Colors.indigo),
            title: Text(routes[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RouteMapScreen(routeName: routes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
