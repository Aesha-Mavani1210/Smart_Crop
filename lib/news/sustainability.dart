import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Sustainabilityenviroment extends StatelessWidget {
  Sustainabilityenviroment({super.key});

  final Uri _url = Uri.parse('https://pmksy.gov.in/');

  Future<void> _launchUrl() async {
    if (!await canLaunch(_url.toString())) {
      throw Exception('Could not launch $_url');
    } else {
      await launch(_url.toString());
    }
  }

  String content = "Sustainability and environmental considerations have become integral aspects of the modern farming sector. With increasing awareness of climate change and the need for responsible resource management, farmers worldwide are adopting practices that prioritize environmental stewardship and long-term sustainability.In the farming sector, sustainability encompasses a range of practices aimed at minimizing environmental impact while maintaining or improving productivity. This includes the adoption of precision farming techniques, which utilize technology such as GPS-guided tractors and sensors to optimize the use of water, fertilizers, and pesticides. By precisely targeting inputs, farmers can reduce waste and minimize the ecological footprint of their operations.In the livestock sector, sustainable farming involves responsible animal husbandry practices. This includes providing animals with adequate living conditions, access to pasture, and humane treatment. Efforts to reduce the carbon footprint of livestock farming often include methane capture technologies, improved waste management, and the use of alternative feeds.Water conservation is a critical concern in sustainable farming, given the increasing pressure on water resources. Farmers are adopting water-efficient irrigation systems, such as drip and sprinkler irrigation, and implementing water-saving technologies to ensure responsible water use. Moreover, sustainable farming practices aim to protect water quality by minimizing runoff of nutrients and agrochemicals into water bodies.";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          " Environmental Safty",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("lib/images/N3.webp"),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchUrl();
                        },
                        child: Text(
                          _url.toString(),
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      ReadMoreText(
                        content,
                        trimLines: 14,
                        textAlign: TextAlign.justify,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: " Show more ",
                        trimExpandedText: " Show less ",
                        lessStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        moreStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}