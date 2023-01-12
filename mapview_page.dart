// ignore_for_file: prefer_const_constructors

import 'package:basics_install/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});
  @override
  State<MapView> createState() => _MapViewState();
}

class MapObject {
  final Widget child;

  ///relative offset from the center of the map for this map object. From -1 to 1 in each dimension.
  final Offset offset;

  ///size of this object for the zoomLevel == 1
  final Size size;

  MapObject({
    required this.child,
    required this.offset,
    required this.size,
  });
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 26, 49),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage(
                    showRegisterPage: () {},
                  );
                }));
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MapView();
                  }));
                },
                child: Icon(
                  Icons.restart_alt_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Center(
                child: GestureDetector(
                  onLongPressEnd: ((details) => {
//Long Press
                      }),
                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 2,
                    child: Stack(
                      children: [
                        Image.asset(
                            'Assets/Lift View Images/room_layout_1.png'),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                        'This Machine is open'.toUpperCase()),
                                  );
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 200,
                              left: 100,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                  Icons.square_rounded,
                                  color: Color.fromARGB(255, 0, 255, 21),
                                  size: 30,
                                ),
                                Text(
                                  '1',
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text('This Machine is being used'
                                        .toUpperCase()),
                                  );
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 200,
                              left: 250,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                  Icons.square_rounded,
                                  color: Color.fromARGB(255, 255, 81, 0),
                                  size: 30,
                                ),
                                Text(
                                  '2',
                                ),
                              ],
                            ),
                          ),
                          onLongPressEnd: (LongPressEndDetails details) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text('HEHEHEHEH'.toUpperCase()),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
