import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Technologicaladvance extends StatelessWidget {
  Technologicaladvance({super.key});

  final Uri _url = Uri.parse('https://agri.gujarat.gov.in/index.htm');

  Future<void> _launchUrl() async {
    if (!await canLaunch(_url.toString())) {
      throw Exception('Could not launch $_url');
    } else {
      await launch(_url.toString());
    }
  }

  String content = "Technological advances in the farming sector have revolutionized traditional agricultural practices, enhancing efficiency, sustainability, and productivity. One significant advancement is the integration of precision farming technologies. Farmers now utilize GPS-guided tractors and equipment, enabling precise navigation and automated control of machinery, resulting in optimized field operations also made and reduced resource wastage.Biotechnology has also made substantial contributions to agriculture. Genetically modified (GM) crops designed for increased resistance to pests, diseases, and harsh environmental conditions contribute to higher yields and reduced dependence on chemical inputs. Precision breeding techniques allow for the development of crops with desirable traits, enhancing overall resilience and adaptability.Technological advances in the farming sector have revolutionized traditional agricultural practices, enhancing efficiency, sustainability, and overall productivity. Precision farming technologies, including GPS-guided tractors and drones, enable farmers to optimize field operations, precisely manage inputs, and monitor crop health. Automated machinery, such as robotic harvesters and planters, streamlines labor-intensive tasks, reducing operational costs and improving output. The integration of data analytics and sensor technologies allows farmers to make data-driven decisions, optimizing irrigation, fertilization, and pest control for improved resource utilization. Biotechnology innovations, like genetically modified crops, contribute to higher yields and increased resistance to pests and diseases. Smart farming solutions leverage the Internet of Things (IoT) to connect sensors and devices, providing real-time monitoring and control over various aspects of farm management. ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Technological Advances",
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
                image: AssetImage("lib/images/N1.jpeg"),
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
                            decoration: TextDecoration.underline,fontSize: 17,
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
