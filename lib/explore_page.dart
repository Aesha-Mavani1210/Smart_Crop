import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:smart_crop/models/fertilizer_product.dart';

import 'data/fertilizer_product.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
  });

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  File? _image;
  List<dynamic>? _output;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    // loadModel().then((value) {
    //   setState(() {
    //     _loading = false;
    //   });
    // });
  }

  // Future<void> loadModel() async {
  //   await Tflite.loadModel(
  //     model: "assets/model_unquant3.tflite",
  //     labels: "assets/labels3.txt",
  //   );
  // }
  //
  // Future<void> _classifyImage() async {
  //   var image = _image;
  //   var output = await Tflite.runModelOnImage(
  //     path: image!.path,
  //     numResults: 2,
  //     threshold: 0.2,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //   );
  //
  //   setState(() {
  //     _loading = false;
  //     _output = output!;
  //   });
  //
  //   // ignore: use_build_context_synchronously
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (context) => DiseasePage(
  //   //       diseaseLabel: _output![0]['label'],
  //   //       image: _image,
  //   //     ),
  //   //   ),
  //   // );
  // }

  Future<void> _pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      _image = File(image.path);
      _loading = true;
    });

    // _classifyImage();
  }

  @override
  void dispose() {
    // Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "What Service are you looking for?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.lightGreen[900],
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ("Search hear.."),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      prefixIcon: const Icon(
                        IconlyLight.search,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 17),
                //   child: IconButton.filled(
                //     onPressed: () {},
                //     icon: const Icon(IconlyLight.filter),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text("+ Add More")),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 90,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 90,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              Categoriess[index].image,
                            ))),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: Categoriess.length),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SizedBox(
                height: 215,
                child: Card(
                  color: Colors.green.shade50,
                  elevation: 8,
                  shadowColor: Colors.green.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Free Consultation",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: Colors.green.shade900),
                              ),
                              const Text(
                                "Get free support from our customers services",
                                style: TextStyle(fontSize: 14.5),
                              ),
                              FilledButton(
                                onPressed: () {},
                                // onPressed: () => _startChat(context),
                                child: const Text(
                                  "Message now",
                                  style: TextStyle(fontSize: 14.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'lib/images/contact_us.png',
                          width: 150,
                        )
                      ],
                    ),
                  ),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Heal your crop",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text("See all")),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            children: [
              SizedBox(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // ignore: unnecessary_null_comparison
                            _image == null ? _showDesign() : _showImage(),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Center _showImage() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 270,
          width: 300,
          color: const Color.fromRGBO(242, 242, 242, 1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  width: 900,
                  child: Image.file(_image!),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(16, 25, 239, 0.9),
                      ),
                      onPressed: _pickImage,
                      child: const Text(
                        'Take A Picture',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center _showDesign() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 270,
          width: 300,
          color: const Color.fromRGBO(242, 242, 242, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 180,
                width: 300,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25.0, left: 20, right: 20),
                      child: FittedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset('assets/leaf.png'),
                            ),
                            const SizedBox(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, top: 20.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 30,
                                  color: Color.fromRGBO(201, 193, 193, 0.9),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset('assets/done.png'),
                            ),
                            const SizedBox(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 30,
                                  color: Color.fromRGBO(201, 193, 193, 0.9),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset('assets/fertilizer.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0, top: 10),
                      child: Row(
                        children: [
                          Text(" Take a \n Picture"),
                          Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Text("\t\t\t\t\tSee \n diagnosis"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text("\t\t\t\t\tGet \n medicine"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(16, 25, 239, 0.9),
                          ),
                          onPressed: _pickImage,
                          child: const Text(
                            'Take A Picture',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
