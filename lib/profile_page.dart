import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:smart_crop/login.dart';
import 'package:smart_crop/order_page.dart';
// import 'package:smart_crop/registration.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  String Fname = "";
  String Lname = "";
  String email = "";

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // _getDataFromFirebase();
  }

  Future<void> _getDataFromFirebase() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;

    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    Fname = userDoc['firstName'] ?? 'Guest';
    Lname = userDoc['lastName'];
    email = userDoc['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 15.0),
                  child: SizedBox(
                    height: 145,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Choose an option"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _getImageFromGallery();
                                  },
                                  child: const Text("Gallery"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _getImageFromCamera();
                                  },
                                  child: const Text("Camera"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: _image != null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundImage: FileImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage('assets/user.png'),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    '$Fname $Lname',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    email,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  title: const Text(
                    "Your Orders",
                    style: TextStyle(fontSize: 17,),
                  ),
                  leading: const Icon(Icons.shopping_cart),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    "Profile Edit",
                    style: TextStyle(fontSize: 17,),
                  ),
                  leading: const Icon(Icons.account_box),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Registration()),);
                  },
                ),
                ListTile(
                  title: const Text(
                    "My Farm",
                    style: TextStyle(fontSize: 17,),
                  ),
                  leading: const Icon(Icons.agriculture),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "Setting",
                    style: TextStyle(fontSize: 17,),
                  ),
                  leading: const Icon(Icons.settings),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "Help",
                    style: TextStyle(fontSize: 17,),
                  ),
                  leading: const Icon(Icons.help),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 17,),
                  ),
                  leading: const Icon(Icons.logout_outlined),
                  onTap: () async {
                    bool logoutConfirmed = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Logout"),
                          content: Text("Are you sure you want to logout?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false); // Return false when cancel button is pressed
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true); // Return true when confirm button is pressed
                              },
                              child: Text("Logout"),
                            ),
                          ],
                        );
                      },
                    );
                    if (logoutConfirmed == true) {
                      // Navigate to the sign-in screen if logout is confirmed
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signing()));
                    }
                  },
                ),

              ],
            );
          }
        },
        future: _getDataFromFirebase(),
      ),
    );
  }
}
