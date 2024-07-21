import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smart_crop/cart_page.dart';
import 'package:smart_crop/models/fertilizer_product.dart';
import 'package:smart_crop/news/news.dart';
import 'package:smart_crop/order_page.dart';
import 'package:smart_crop/profile_page.dart';
import 'package:smart_crop/services_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages = [const Homepage(),const ServicesPage(),CartPage(),const ProfilePage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              // accountName: Text('$Fname $Lname',style: TextStyle(color: Colors.white),),
              accountName: const Text(
                'Fname Lname',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail:
                  const Text('email', style: TextStyle(color: Colors.white)),
              // accountEmail: Text('$email',style: TextStyle(color: Colors.white)) ,
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('lib/images/A4.webp'),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                image: const DecorationImage(
                  image: AssetImage('lib/images/a7.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text('Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderPage()),);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Shoppings'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Fertilizer()),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: const Text('News'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Agriculture()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('payments'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.difference),
              title: const Text('Tools'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share App'),
              onTap: () {
                Share.share('Check out this awesome app!');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 115.0),
              child: ListTile(
                title: const Text("Logout",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                leading: const Icon(Icons.logout_outlined),
                onTap: () async {
                  bool logoutConfirmed = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(
                                  false); // Return false when cancel button is pressed
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(
                                  true); // Return true when confirm button is pressed
                            },
                            child: const Text("Logout"),
                          ),
                        ],
                      );
                    },
                  );
                  if (logoutConfirmed == true) {
                    // Navigate to the sign-in screen if logout is confirmed
                  }
                },
              ),
            ),
          ],
        ),

        // child: Column(
        //   children: [
        //     DrawerHeader(
        //       padding:  const EdgeInsets.all(20),
        //       decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //           colors: [
        //             Theme.of(context).colorScheme.primaryContainer,
        //             Theme.of(context)
        //                 .colorScheme
        //                 .primaryContainer
        //                 .withOpacity(0.8),
        //           ],
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight,
        //         ),
        //       ),
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.person,
        //             size: 50,
        //             color: Theme.of(context).colorScheme.primary,
        //           ),
        //           SizedBox(width: 18),
        //           Text(
        //             'Guest',
        //             style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
        //           ),
        //         ],
        //       ),
        //     ),
        //     ListTile(
        //       leading: Icon(
        //         Icons.settings,
        //         size: 26,
        //         color: Theme.of(context).colorScheme.onBackground,
        //       ),
        //       title: Text(
        //         'Filters',
        //         style: Theme.of(context).textTheme.titleSmall!.copyWith(
        //               color: Theme.of(context).colorScheme.onBackground,
        //               fontSize: 20,
        //             ),
        //       ),
        //       onTap: () {
        //       },
        //     ),
        //   ],
        // ),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Fname 👋",
              // "Hello $Fname 👋",
              style: TextStyle(fontSize: 16, color: Colors.green.shade800),
            ),
            Text(
              "Enjoy our services",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: badges.Badge(
                  badgeContent: const Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  badgeStyle: const badges.BadgeStyle(badgeColor: Colors.green),
                  position: badges.BadgePosition.topEnd(top: -15, end: -12),
                  child: const Icon(Icons.notifications)),
            ),
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(IconlyBold.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.bag),
            activeIcon: Icon(IconlyBold.bag),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            activeIcon: Icon(IconlyBold.buy),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            activeIcon: Icon(IconlyBold.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
