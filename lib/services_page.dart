import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smart_crop/data/services.dart';
import 'package:smart_crop/fertilizer.dart';
import 'package:smart_crop/machinery.dart';
import 'package:smart_crop/models/service.dart';
import 'package:http/http.dart' as http;
import 'package:smart_crop/seed.dart';
import 'package:smart_crop/utils/extention/date.dart';

import 'models/service.dart';
import 'news/news.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  WeatherDataModel weatherData = WeatherDataModel();

  bool isDataLoading = false;



  getWeatherData() async {
    setState(() {
      isDataLoading = true;
    });
    var url = Uri.parse(
        "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Surat?unitGroup=metric&key=7JWQMV9WC5JJBUQF22L83ERCB&contentType=json");
    var response = await http.get(
      url,
    );
    weatherData = weatherDataModelFromJson(response.body);
    print(weatherData.description);
    setState(() {
      isDataLoading = false;
    });
    setState(() {});

  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
            children: [
              if (isDataLoading == false) ...[
                Container(
                  margin: const EdgeInsets.all(14),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                      "Today, ${DateTime.now().day} ${DateTime.now().formatDate.split(" ").first}"),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${weatherData.days?.first.temp?.toInt()}",
                                      style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Icon(
                                        Icons.album_rounded,
                                        size: 15,
                                      ),
                                    ),
                                    const Text(
                                      "C",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    DateTime.now().hour >= 19 ||
                                        DateTime.now().hour < 6
                                        ? "Night"
                                        : DateTime.now().hour >= 6 &&
                                        DateTime.now().hour < 12
                                        ? "Morning"
                                        : DateTime.now().hour >= 12 &&
                                        DateTime.now().hour < 17
                                        ? "Afternoon"
                                        : "Sunset",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.7),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              DateTime.now().hour >= 19 || DateTime.now().hour < 6
                                  ? "lib/images/night.png"
                                  : "lib/images/sun.png",
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        color: Colors.yellow.shade500,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.white,
                              ),
                            ),
                            const Expanded(
                              child: Text("Location permission require",style: TextStyle(color: Colors.black),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Allow",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ] else ...[
                const Center(child: CircularProgressIndicator())
              ],

             GridView.builder(
               shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                itemCount: services.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final Service = services[index];
                  return GestureDetector(
                    onTap: () {
                      final item = services[index];
                      switch (item.name) {
                        case 'Fertilizer ':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Fertilizer()));
                          break;
                        case 'Seeds':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Seed()));
                          break;
                        case 'News':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Agriculture()));
                          break;
                        case 'Machinery':
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Machinery()));
                          break;
                        default:
                          break;
                      }
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            Service.image,
                          ),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.3),
                              ),
                              child: Text(
                                Service.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                          ),
                        ),
                      ),
                  ),
                  );
                },
            ),
            ]
          ),
      );
  }
}
