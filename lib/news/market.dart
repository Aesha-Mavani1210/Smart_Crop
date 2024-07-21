import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Marketupdates extends StatelessWidget {
   Marketupdates({super.key});

   final Uri _url = Uri.parse('https://agmarknet.gov.in/');

   Future<void> _launchUrl() async {
     if (!await canLaunch(_url.toString())) {
       throw Exception('Could not launch $_url');
     } else {
       await launch(_url.toString());
     }
   }


   String content = "Market updates in the farming sector provide crucial information about the current trends, prices, and demand-supply dynamics of agricultural commodities. These updates play a pivotal role in helping farmers, traders, and stakeholders make informed decisions. A comprehensive market update typically includes details on commodity prices, both at the local and global levels, allowing farmers to assess the economic viability of their crops. Additionally, reports may cover market trends, identifying shifts in consumer preferences, emerging markets, and factors influencing demand.Key components of market updates include detailed analyses of commodity prices, examining fluctuations influenced by factors such as weather conditions, global trade dynamics, and geopolitical events. Additionally, these reports may cover the performance of specific crops, addressing issues like crop yield projections, quality assessments, and disease outbreaks that could impact supply.Overall, market updates serve as a critical tool for farmers to navigate the complexities of the agricultural economy. By staying informed about pricing trends, global market conditions, and relevant policy changes, farmers can optimize their decision-making processes, enhance productivity, and ensure the economic sustainability of their operations.In summary, market updates in the farming sector serve as a comprehensive source of information, covering commodity prices, market trends, government policies, and weather conditions. Farmers rely on these updates to navigate the complex dynamics of the agricultural market, make strategic decisions, and optimize their agricultural practices to maximize profitability and sustainability.";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Market Updates",
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
                image: AssetImage("lib/images/Z5.jpg"),
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