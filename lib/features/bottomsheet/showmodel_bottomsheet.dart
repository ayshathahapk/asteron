import 'package:asteron/features/bottomsheet/aboutus.dart';
import 'package:asteron/features/bottomsheet/graph.dart';
import 'package:asteron/features/bottomsheet/products.dart';
import 'package:asteron/features/bottomsheet/trendanalysis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../main.dart';
import 'bankdetails.dart';

List a = [
  {'text': 'Bank details', 'icon': Icon(Icons.maps_home_work_rounded, color:Color(0xFFBFA13A))},
  {'text': "About Us", 'icon': Icon(Icons.person, color:Color(0xFFBFA13A))},
  {'text': " Products", 'icon': Icon(Icons.production_quantity_limits, color:Color(0xFFBFA13A))},
  {'text': "Graph", 'icon': Icon(Icons.auto_graph, color:Color(0xFFBFA13A))},
  {'text': "Trend Analysis", 'icon': Icon(Icons.stars_sharp, color:Color(0xFFBFA13A))},
];

List b = [
  BankDetails(),
  Aboutus(),
  Products(),
  Graph(),
  TrendAnalysis(),
];

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({Key? key}) : super(key: key);

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: height * 0.35,
      width: width,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: a.length,
          itemBuilder: (context, index) {
            return
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => b[index]),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.10),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height * 0.10,
                            width: width * 0.20,
                            color:Color(0xFF061534),
                            child: Stack(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      a[index]['icon'],
                                      SizedBox(height: height * 0.01),
                                      Text(
                                        a[index]['text'],
                                        style: GoogleFonts.urbanist(color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}