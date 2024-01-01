import "dart:convert";
import "dart:ui";
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import "package:weatherapp/secrets.dart";

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityname = "London";
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityname&APPID=$openAPI',
        ),
      );
      final data = jsonDecode(res.body);

      if (int.parse(data['cod']) != 200) {
        throw 'An unexpected error occured';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final data = snapshot.data!;
          final currenttemp = data['list'][0]['main']['temp'];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //main
                SizedBox(
                  //use conatiners to to edit width and height and Sized Box to only edit Width
                  width: double.infinity,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '$currenttemp K',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Icon(
                                Icons.cloud,
                                size: 60,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Rain",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //weather forecast cards
                const Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 110,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 6,
                          child: const Column(children: [
                            SizedBox(height: 8),
                            Text(
                              "03:00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.cloud,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "320.12",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 8),
                          ]),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 6,
                          child: const Column(children: [
                            SizedBox(height: 8),
                            Text(
                              "03:00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.cloud,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "320.12",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 8),
                          ]),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 6,
                          child: const Column(children: [
                            SizedBox(height: 8),
                            Text(
                              "03:00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.cloud,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "320.12",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 8),
                          ]),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 6,
                          child: const Column(children: [
                            SizedBox(height: 8),
                            Text(
                              "03:00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.cloud,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "320.12",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 8),
                          ]),
                        ),
                      ),
                      SizedBox(
                        width: 110,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 6,
                          child: const Column(children: [
                            SizedBox(height: 8),
                            Text(
                              "03:00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.cloud,
                              size: 40,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "320.12",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 8),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                //additional info
                const Text(
                  "Additonal Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [
                      Icon(Icons.water_drop),
                      Text(
                        "Humidity",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "94",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    Column(children: [
                      Icon(Icons.wind_power),
                      Text(
                        "Wind Speed",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "7.67",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    Column(children: [
                      Icon(Icons.beach_access),
                      Text(
                        "Pressure",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "1006",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
