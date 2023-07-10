import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final TextEditingController locationNameController = TextEditingController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? latitude;
  String? longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Location using coordinates'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              color: const Color.fromARGB(139, 116, 65, 255),
              child: TextFormField(
                controller: widget.locationNameController,
              ),
            ),
            const Text('Latitude'),
            Text(
              latitude ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text('Longitude'),
            Text(
              longitude ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.search),
      ),
    );
  }

  void _incrementCounter() async {
    String? query = widget.locationNameController.text;

    List<Location> locations = await locationFromAddress(query);

    setState(() {
      latitude = locations[0].latitude.toString();
      longitude = locations[0].longitude.toString();
    });
  }
}
