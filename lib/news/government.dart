import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Govermentpolicies extends StatelessWidget {
   Govermentpolicies({super.key});

   final Uri _url = Uri.parse('https://agriwelfare.gov.in/en/Major');

   Future<void> _launchUrl() async {
     if (!await canLaunch(_url.toString())) {
       throw Exception('Could not launch $_url');
     } else {
       await launch(_url.toString());
     }
   }

  String content = "Government policies and regulations play a pivotal role in shaping the landscape of the farming sector. These policies are designed to address various aspects of agriculture, ranging from production and distribution to environmental sustainability and rural development. Governments implement measures to support farmers, ensure food security, and promote sustainable practices.Regulations within the farming sector cover a wide spectrum, including land use, water management, pesticide and fertilizer application, and animal welfare standards. Governments establish guidelines to promote responsible and sustainable farming practices, balancing the need for increased productivity with environmental conservation.Additionally, policies may address issues related to rural development, infrastructure, and access to resources. Investments in rural areas can include the construction of roads, schools, healthcare facilities, and other essential services, fostering the overall well-being of farming communities.Environmental concerns have led to the implementation of regulations promoting sustainable agriculture. These regulations may encourage practices such as organic farming, conservation tillage, and the use of environmentally friendly technologies. Governments also play a role in incentivizing the adoption of innovative technologies, such as precision farming and digital agriculture, to enhance productivity and reduce environmental impact.";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Government Policies",
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
                image: AssetImage("lib/images/z3.png"),
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