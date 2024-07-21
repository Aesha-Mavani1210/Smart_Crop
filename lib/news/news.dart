import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smart_crop/data/fertilizer_product.dart';
import 'package:smart_crop/news/government.dart';
import 'package:smart_crop/news/market.dart';
import 'package:smart_crop/news/sustainability.dart';
import 'package:smart_crop/news/technological.dart';

class Agriculture extends StatelessWidget {
  const Agriculture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "News",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: newss.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.9,
          ),
          itemBuilder: (context, index) {
            final News = newss[index];
            return GestureDetector(
              onTap: () {
                final item = newss[index];
                switch (item.name) {
                  case 'Technological Advances':
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Technologicaladvance()));
                    break;
                  case 'Market Updates':
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Marketupdates()));
                    break;
                  case 'Government Policies and Regulations':
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Govermentpolicies()));
                    break;
                  case 'Sustainability and Environmental':
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Sustainabilityenviroment()));
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
                      News.image,
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
                        News.name,
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
      );
  }
}
