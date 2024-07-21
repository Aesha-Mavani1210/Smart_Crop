import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:smart_crop/models/fertilizer_product.dart';

Cart myCart = Cart();

class FertilizerCart extends StatelessWidget {
  const FertilizerCart({super.key, required this.fertilizer});

  final Fertilizer fertilizer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => FertilizerDetailPage(fertilizer: fertilizer),
        // ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            side: BorderSide(
              width: 0.4,
              color: Colors.grey,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
              alignment: Alignment.topRight,
              height: 105, // 150
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(fertilizer.image),
                fit: BoxFit.cover,
              )),
              child: SizedBox(
                width: 27,
                height: 27,
                child: IconButton.filled(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    iconSize: 14,
                    icon: const Icon(IconlyLight.bookmark)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      fertilizer.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 9,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "₹${fertilizer.price}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "/${fertilizer.unit}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 27,
                        height: 27,
                        child: IconButton.filled(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            final cart =
                                Provider.of<Cart>(context, listen: false);
                            cart.addToCart(fertilizer);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class SeedCart extends StatelessWidget {
  const SeedCart({super.key, required this.seed});

  final Seed seed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => SeedDetailPage(seed: seed),
        // ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(
              width: 0.4,
              color: Colors.grey,
            ),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.topRight,
              height: 105, // 150
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(seed.image),
                fit: BoxFit.cover,
              )),
              child: SizedBox(
                width: 27,
                height: 27,
                child: IconButton.filled(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    iconSize: 14,
                    icon: const Icon(IconlyLight.bookmark)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      seed.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 9,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "₹${seed.price}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "/${seed.unit}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 27,
                        height: 27,
                        child: IconButton.filled(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            final cart =
                                Provider.of<Cart>(context, listen: false);
                            cart.addToCart(seed);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class MachineryCart extends StatelessWidget {
  const MachineryCart({super.key, required this.machinery});

  final Machinery machinery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => MachineryDetailPage(machinery: machinery),
        // ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(
              width: 0.4,
              color: Colors.grey,
            ),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.topRight,
              height: 105, //150
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(machinery.image),
                fit: BoxFit.cover,
              )),
              child: SizedBox(
                width: 27,
                height: 27,
                child: IconButton.filled(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    iconSize: 14,
                    icon: const Icon(IconlyLight.bookmark)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      machinery.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 9,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "₹${machinery.price}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "/${machinery.unit}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 27,
                        height: 27,
                        child: IconButton.filled(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            final cart =
                                Provider.of<Cart>(context, listen: false);
                            cart.addToCart(machinery);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
