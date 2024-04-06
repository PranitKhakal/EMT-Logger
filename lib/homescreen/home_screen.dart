import 'package:emt/feature/avaiable_detail.dart';
import 'package:emt/feature/dispatch_detail.dart';
import 'package:emt/feature/acknowledge_detail.dart';
import 'package:emt/feature/enroute_detail.dart';
import 'package:emt/feature/first_custom_detail.dart';
import 'package:emt/feature/first_vitals_detail.dart';
import 'package:emt/feature/leaving_referral_detail.dart';
import 'package:emt/feature/patient_detail.dart';
import 'package:emt/feature/pt_transfarred_detail.dart';
import 'package:emt/feature/scene_detail.dart';
import 'package:emt/feature/second_custom_detail.dart';
import 'package:emt/feature/second_vitals_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Map to store button colors, keyed by button text
  Map<String, Color> _buttonColors = {};
  Map<String, double> _buttonWidths = {};
  Map<String, bool> _imageVisibilities = {};
  Map<String, String> _buttonTexts = {};
  Map<String, String> _buttonGeneratedTimes = {};

  Widget _buildButtonSection(
      String buttonText,
      String text,
      Widget pageToNavigate,
      ) {
    // Initialize color for the button if not already set
    _buttonColors.putIfAbsent(buttonText, () => Color(0xFF2D56A9));
    _buttonWidths.putIfAbsent(buttonText, () => 311);
    _imageVisibilities.putIfAbsent(
        buttonText, () => false); // Initially image is not visible
    _buttonTexts.putIfAbsent(
        buttonText, () => buttonText); // Set initial button text

    return GestureDetector(
      onTap: () {
        setState(() {
          // Update color for this button when clicked
          _buttonColors[buttonText] = Color(0xFFFFFFFF); // Change color here
          _buttonWidths[buttonText] = 261; // Update width of the button
          _imageVisibilities[buttonText] = true; // Make the image visible

          // Get current system time and date
          DateTime now = DateTime.now();
          DateFormat formatter = DateFormat('dd/MM/yy hh:mm a');
          String formattedDateTime = formatter.format(now);

          // Update the button text with formatted date and time
          _buttonTexts[buttonText] = formattedDateTime;

          // Store the generated time for this button
          _buttonGeneratedTimes[buttonText] = formattedDateTime;
        });
      },
      child: Container(
        width: 375,
        height: 110,
        decoration: BoxDecoration(
          color: Color(0xFFF2F4F5),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: _buttonTexts[buttonText] != buttonText ? Colors.blue : Colors.red, // Check if timestamp is generated, change color to blue
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Update color for this button when clicked
                        _buttonColors[buttonText] =
                            Color(0xFFFFFFFF); // Change color here
                        _buttonWidths[buttonText] =
                        261; // Update width of the button
                        _imageVisibilities[buttonText] =
                        true; // Make the image visible

                        // Get current system time and date
                        DateTime now = DateTime.now();
                        DateFormat formatter = DateFormat('dd/MM/yy hh:mm a');
                        String formattedDateTime = formatter.format(now);

                        // Update the button text with formatted date and time
                        _buttonTexts[buttonText] = formattedDateTime;

                        // Store the generated time for this button
                        _buttonGeneratedTimes[buttonText] = formattedDateTime;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _buttonColors[buttonText], // Use stored color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Color(0xFFACACAC)),
                      ),
                      fixedSize: Size(
                          _buttonWidths[buttonText]!, 40), // Use dynamic width
                    ),
                    child: Text(
                      _buttonTexts[buttonText]!, // Use stored button text
                      style: TextStyle(
                        color: _buttonColors[buttonText] == Color(0xFFFFFFFF)
                            ? Colors.black
                            : Colors.white,
                        // Change text color to black when button is clicked
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Adjust spacing between button and image
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
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xFFACACAC)),
                          color: Color(0xFF2D56A9),
                        ),
                        padding: EdgeInsets.all(8),
                        // Adjust padding as needed
                        child: Center(
                          child: Container(
                            width: 24, // Adjust the width of the image
                            height: 24, // Adjust the height of the image
                            child: SvgPicture.asset(
                              'assets/images/Group.SVG', // Replace with your SVG image path
                            ),
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



  Widget _buildClearAllButton() {
    return Center(
      child: Container(
        height: 40,
        width: 310.43,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFC80605), width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ElevatedButton(
          onPressed: () {
            // Add clear all functionality here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          child: Text(
            'Clear All',
            style: TextStyle(
              color: Color(0xFFC80605),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.PNG',
                width: 42,
                height: 42,
              ),
              SizedBox(width: 8),
              const Text(
                'Monmouth Junction EMT Time Log',
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontFamily: 'Inter',
                  fontSize: 17,
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
        padding: const EdgeInsets.all(30.0),
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
                        _buttonGeneratedTimes["Mark as Dispatched 1"] ?? ""),
              ),
              SizedBox(height: 16),
              _buildButtonSection(
                "Mark as Acknowledged",
                "Acknowledged",
                AcknowledgmentDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Acknowledged"] ?? ""),
              ),
              SizedBox(height: 16),
              _buildButtonSection(
                "Mark as Enroute",
                "Enroute",
                EnRouteDetail(
                    timestamp: _buttonGeneratedTimes["Mark as Enroute"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark as At Scene 4",
                "Scene",
                SceneDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as At Scene 4"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark as At Patient 5",
                "Patient",
                PatientDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark Vitals 1 taken",
                "Vitals 1",
                FirstVitalsDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark Vitals 2 taken",
                "Vitals 2",
                SecondVitalsDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark as Leaving Referral",
                "Leaving Referral",
                LeavingReferralDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark as At Hospital",
                "At Hospital",
                AcknowledgmentDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark as Pt Transferred",
                "Pt Transferred",
                PtTransferredDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark as Available",
                "Available",
                AvailableDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark as Custom",
                "Custom 1",
                FirstCustomDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildButtonSection(
                "Mark as Custom",
                "Custom 2",
                SecondCustomDetail(
                    timestamp:
                        _buttonGeneratedTimes["Mark as Dispatched 2"] ?? ""),
              ),
              SizedBox(height: 16),

              _buildClearAllButton(),
              // Adding Clear All button
              SizedBox(height: 16),
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
