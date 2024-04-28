import 'package:flutter/material.dart';
import 'package:weather_project/data/my_location.dart';
import 'package:weather_project/data/network.dart';

const apikey = '8bfc9e11b663cb0cbc87475d69ee8166';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
    // fetchData();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey');
    var weatherData = await network.getJsonData();
    print(weatherData);
  }

  // void fetchData() async {

  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);

  //     var wind = parsingData['wind']['speed'];
  //     print(wind);

  //     var id = parsingData['id'];
  //     print(id);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          onPressed: () {
            getLocation();
          },
          child: const Text(
            'Get my location',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
