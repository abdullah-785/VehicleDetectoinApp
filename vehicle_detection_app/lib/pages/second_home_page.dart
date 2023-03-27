import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/login.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/reset_password.dart';
import 'package:vehicle_detection_app/pages/setting.dart';

class SecondHomePage extends StatefulWidget {
  SecondHomePage({super.key});

  @override
  State<SecondHomePage> createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    // height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 35,
                              spreadRadius: 30,
                              offset: const Offset(3, 3))
                        ]),
                    child: const Image(
                      image: AssetImage(
                        "images/logo1.png",
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 20,
                  blurRadius: 15,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Welcome to Vehicle Detection App",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 23, 69, 103),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CarouselSlider(
                    items: imageUrl.map((i) {
                      return Builder(
                        builder: (BuildContext buildContext) {
                          return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    i,
                                    fit: BoxFit.fill,
                                  )));
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 150,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Introduction",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 23, 69, 103),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "Deep learning is a potential solution for object detection and scene perception problems which can enable algorithm-driven and data-drive cars. Automatic recognition of vehicles has been widely used in vehicle information systems and intelligent traffic systems. Analyzing and interpreting a large amount of data. Traffic management is too difficult and the traffic hazards increase at a high rate. Our system detects, classifies, and counts the moving vehicles from video. The effective solutions to the problem of urban traffic congestion, and it is also one of the important topics of smart city construction. The traffic police can not monitored multiple rules violation at the same time. That is why we will implement this system to help out the police departments.",
                      style: TextStyle(decorationThickness: 20),
                    ),
                  ),
                  SizedBox(height: 25,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.7,
                    child: chartToRun(),
                  ),
                  SizedBox(height: 60,),
                ],
              ),
            ),
          ))
        ],
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        unselectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        iconSize: 30,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Setting()));
                },
                child: const Icon(Icons.settings)),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondHomePage()));
                },
                child: const Icon(Icons.home)),

            label: 'Home',
          ),
          
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  Profile()));
                },
                child: const Icon(Icons.account_circle)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  final List imageUrl = ['images/1.jpg', 'images/2.jpg', 'images/4.jpg'];
}


Widget chartToRun() {
  LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  ChartData chartData;
  ChartOptions chartOptions = const ChartOptions();

  chartData = ChartData(
  dataRows: const [
  [4.0, 6.0, 5.0, 8.0, 9.0, 11.0],
  [4.0, 5.0, 7.0, 6.0, 10.0, 13.0],
  ],
  xUserLabels: const ['2017','2018','2019', '2020', '2021', '2022'],
  dataRowsColors: const [
  Color.fromARGB(255, 78, 206, 113),
  Color.fromARGB(255, 23, 69, 103)
  ],
  dataRowsLegends: const ['Break Rules', 'Accidents'],
  yUserLabels: const [
  '500',
  '1000',
  '1500',
  '2000',
  '2500',
  '3000',
  '4000',
  '4500'
  ],
  chartOptions: chartOptions,
  );

  var lineChartContainer = LineChartTopContainer(
    chartData: chartData,
    xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
  );

  var lineChart = LineChart(
    painter: LineChartPainter(
      lineChartContainer: lineChartContainer,
    ),
  );
  return lineChart;
}