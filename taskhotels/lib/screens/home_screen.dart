import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> cityNames = [
    'Select a city',
    'Cairo',
    'London',
    'Alex',
    'Minya',
    'Aswan',
  ];
  String selectedValue = 'Select a city';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 400,
                ),
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Color(0XFF50B6FE), Color(0XFF377FB1)]),
                    ),
                    child: Text(
                      'Hotel Search',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Color(0XFF50B6FE), Color(0XFF377FB1)]),
                  ),
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        items: cityNames
                            .map<DropdownMenuItem<String>>(
                                (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.black),
                                    )))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          if (value != null) {
                           setState(() {
                             selectedValue = value;
                           });
                          }
                        },
                      ),
                      const Text('data')
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Define your custom path here
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
