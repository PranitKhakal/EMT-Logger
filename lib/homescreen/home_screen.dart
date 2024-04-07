import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../feature/acknowledge_detail.dart';
import '../feature/avaiable_detail.dart';
import '../feature/dispatch_detail.dart';
import '../feature/enroute_detail.dart';
import '../feature/first_custom_detail.dart';
import '../feature/first_vitals_detail.dart';
import '../feature/leaving_referral_detail.dart';
import '../feature/patient_detail.dart';
import '../feature/pt_transfarred_detail.dart';
import '../feature/scene_detail.dart';
import '../feature/second_custom_detail.dart';
import '../feature/second_vitals_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, Color> _buttonColors = {};
  Map<String, double> _buttonWidths = {};
  Map<String, bool> _imageVisibilities = {};
  Map<String, String> _buttonTexts = {};
  Map<String, String> _buttonGeneratedTimes = {};

  void _resetButtonStates() {
    setState(() {
      _buttonColors.clear();
      _buttonWidths.clear();
      _imageVisibilities.clear();
      _buttonTexts.clear();
      _buttonGeneratedTimes.clear();
    });
  }

  Widget _buildButtonSection(
      String buttonText,
      String text,
      Widget pageToNavigate,
      String dynamicText,
      double screenWidth,
      double fontSize,
      double buttonWidth,
      ) {
    _buttonColors.putIfAbsent(buttonText, () => Color(0xFF2D56A9));
    _buttonWidths.putIfAbsent(buttonText, () => buttonWidth);
    _imageVisibilities.putIfAbsent(buttonText, () => false);
    _buttonTexts.putIfAbsent(buttonText, () => buttonText);

    return GestureDetector(
      onTap: () {
        setState(() {
          _buttonColors[buttonText] = Color(0xFFFFFFFF);
          _buttonWidths[buttonText] = screenWidth * 0.7;
          _imageVisibilities[buttonText] = true;

          DateTime now = DateTime.now();
          DateFormat formatter = DateFormat('dd/MM/yy hh:mm a');
          String formattedDateTime = formatter.format(now);

          _buttonTexts[buttonText] = formattedDateTime;
          _buttonGeneratedTimes[buttonText] = formattedDateTime;
        });
      },
      child: Container(
        width: screenWidth * 0.9,
        height: screenWidth * 0.32,
        decoration: BoxDecoration(
          color: Color(0xFFF2F4F5),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded( // Added Expanded widget
                    child: Row(
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color: _buttonTexts[buttonText] != buttonText
                                ? Colors.blue
                                : Colors.red,
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Visibility(
                          visible: _buttonColors[buttonText] == Color(0xFFFFFFFF),
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth * 0.01),
                              Container(
                                width: screenWidth * 0.02,
                                height: screenWidth * 0.02,
                                child: SvgPicture.asset(
                                  "assets/images/check.SVG",
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.01),
              Row(
                children: [
                  Expanded( // Added Expanded widget
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _buttonColors[buttonText] = Color(0xFFFFFFFF);
                          _buttonWidths[buttonText] = screenWidth * 0.7;
                          _imageVisibilities[buttonText] = true;

                          DateTime now = DateTime.now();
                          DateFormat formatter = DateFormat('dd/MM/yy hh:mm a');
                          String formattedDateTime = formatter.format(now);

                          _buttonTexts[buttonText] = formattedDateTime;
                          _buttonGeneratedTimes[buttonText] = formattedDateTime;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _buttonColors[buttonText],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Color(0xFFACACAC)),
                        ),
                        fixedSize: Size(_buttonWidths[buttonText]!, screenWidth * 0.07),
                      ),
                      child: Text(
                        _buttonTexts[buttonText]!,
                        style: TextStyle(
                          color: _buttonColors[buttonText] == Color(0xFFFFFFFF)
                              ? Colors.black
                              : Colors.white,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Visibility(
                    visible: _imageVisibilities[buttonText]!,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pageToNavigate,
                          ),
                        );
                      },
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xFFACACAC)),
                          color: Color(0xFF2D56A9),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Center(
                          child: Container(
                            width: screenWidth * 0.06,
                            height: screenWidth * 0.06,
                            child: SvgPicture.asset(
                              'assets/images/Group.SVG',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.01),
              Row(
                children: [
                  Expanded( // Added Expanded widget
                    child: Container(
                      width: screenWidth * 0.03,
                      height: screenWidth * 0.03,
                      child: SvgPicture.asset(
                        'assets/images/Group.SVG',
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.005),
                  Expanded( // Added Expanded widget
                    flex: 8, // Added flex property to control width distribution
                    child: Text(
                      dynamicText,
                      style: TextStyle(
                        fontSize: fontSize * 0.8,
                        color: Colors.black,
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


  Widget _buildClearAllButton(
      BuildContext context, double screenWidth, double fontSize) {
    return Center(
      child: Container(
        height: screenWidth * 0.09,
        width: screenWidth * 0.75,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFC80605), width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
          onPressed: () {
            _showClearConfirmationDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          child: Text(
            'Clear All',
            style: TextStyle(
              color: Color(0xFFC80605),
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }

  void _showClearConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Are you sure you want to clear all items?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _resetButtonStates();
                Navigator.of(context).pop();
              },
              child: Text("Clear All"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSize = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.PNG',
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
              ),
              SizedBox(width: screenWidth * 0.02),
              Text(
                'Monmouth Junction EMT Time Log',
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontFamily: 'Inter',
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.08),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildButtonSection(
                "Mark as Dispatched 1",
                "Dispatched",
                DispatchDetail(
                  timestamp:
                      _buttonGeneratedTimes["Mark as Dispatched 1"] ?? "",
                ),
                "Dynamic Text 1",
                screenWidth,
                fontSize,
                screenWidth * 0.7,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                "Mark as Acknowledged",
                "Acknowledged",
                AcknowledgmentDetail(
                  timestamp:
                      _buttonGeneratedTimes["Mark as Acknowledged"] ?? "",
                ),
                "Dynamic Text 1",
                screenWidth,
                fontSize,
                screenWidth * 0.7,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                "Mark as Enroute",
                "Enroute",
                EnRouteDetail(
                    timestamp: _buttonGeneratedTimes["Mark as Enroute"] ?? ""),
                "Dynamic Text 1",
                screenWidth,
                fontSize,
                screenWidth * 0.7,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark as At Scene 4",
                  "Scene",
                  SceneDetail(
                      timestamp:
                          _buttonGeneratedTimes["Mark as At Scene 4"] ?? ""),
                  "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark as At Patient 5",
                  "Patient",
                  PatientDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark as At Patient 5"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark Vitals 1 taken",
                  "Vitals 1",
                  FirstVitalsDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark Vitals 1 taken"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark Vitals 2 taken",
                  "Vitals 2",
                  SecondVitalsDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark Vitals 2 taken"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark as Leaving Referral",
                  "Leaving Referral",
                  LeavingReferralDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark as Leaving Referral"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark as At Hospital",
                  "At Hospital",
                  AcknowledgmentDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark as At Hospital"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark as Pt Transferred",
                  "Pt Transferred",
                  PtTransferredDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark as Pt Transferred"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark as Available",
                  "Available",
                  AvailableDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark as Available"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark as Custom 1",
                  "Custom 1",
                  FirstCustomDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark as Custom 1"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildButtonSection(
                  "Mark as Custom 2",
                  "Custom 2",
                  SecondCustomDetail(
                      timestamp:
                      _buttonGeneratedTimes["Mark as Custom 2"] ?? ""), "Dynamic Text 1",
                  screenWidth,
                  fontSize,
                  screenWidth * 0.7
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildClearAllButton(context, screenWidth, fontSize),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
