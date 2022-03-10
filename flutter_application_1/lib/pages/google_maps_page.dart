import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class Google_maps_page extends StatefulWidget {
  @override
  _Google_maps_pageState createState() => _Google_maps_pageState();
}

class _Google_maps_pageState extends State<Google_maps_page> {
  var long = "longitude";
  var lat = "latitude";
  void getlocation() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        long = currentLoc.longitude.toString();
        lat = currentLoc.latitude.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text("Google_Maps")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "logitude : " + long,
              style: TextStyle(
                
                fontSize: 30,
              ),
            ),
            Text(
              "latitude : " + lat,
              style: TextStyle(
                
                fontSize: 30,
              ),
            ),
            MaterialButton(
              onPressed: getlocation,
              
              child: Text(
                "Get Location",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}