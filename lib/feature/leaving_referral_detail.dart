import 'package:flutter/material.dart';

class LeavingReferralDetail extends StatefulWidget {
  final String timestamp; // Define a parameter to receive the timestamp

  // Constructor to receive the timestamp
  LeavingReferralDetail({required this.timestamp});

  @override
  _LeavingReferralDetailState createState() => _LeavingReferralDetailState();
}

class _LeavingReferralDetailState extends State<LeavingReferralDetail> {
  TextEditingController _textController = TextEditingController();
  int _characterCount = 0;

  @override
  Widget build(BuildContext context) {
    // Store MediaQuery size
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Remove the title
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.red),
              onPressed: () {
                Navigator.pop(context); // Navigate back when back arrow is clicked
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: mediaQuery.width * 0.05), // Adjusted padding
                child: Text(
                  'Back to Home',
                  style: TextStyle(
                    height: mediaQuery.height * 0.0025, // Adjusted height
                    color: Color(0xFFC80605),
                    fontFamily: 'Inter',
                    fontSize: mediaQuery.height * 0.016, // Adjusted font size
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: mediaQuery.width * 0.02), // Adjusted padding
            child: Image.asset(
              'assets/images/logo.PNG', // Replace with your logo asset path
              width: mediaQuery.width * 0.08, // Adjusted width
              height: mediaQuery.height * 0.05, // Adjusted height
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mediaQuery.height * 0.03), // Add margin top
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05), // Adjusted padding
              child: Text(
                'Leaving Referral',
                style: TextStyle(
                  color: Color(0xFF1A4191),
                  fontFamily: 'Inter',
                  fontSize: mediaQuery.height * 0.022, // Adjusted font size
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                  height: 1.25,
                ),
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.04),
            // Display timestamp
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.1), // Adjusted margin
              child: Container(
                height: mediaQuery.height * 0.016, // Adjusted height
                alignment: Alignment.centerLeft, // Align text to left
                child: Text(
                  'Date and Time:',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'Inter',
                    fontSize: mediaQuery.height * 0.016, // Adjusted font size
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    height: 1.25,
                  ),
                ),
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.016),
            // Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.1), // Adjusted margin
              child: ElevatedButton(
                onPressed: () {
                  // Add your button press logic here
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xFFACACAC), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Container(
                  height: mediaQuery.height * 0.04, // Adjusted height
                  width: mediaQuery.width * 0.8, // Adjusted width
                  alignment: Alignment.center,
                  child: Text(
                    widget.timestamp, // Your button text
                    style: TextStyle(
                      color: Color(0xFF313131),
                      fontFamily: 'Inter',
                      fontSize: mediaQuery.height * 0.016, // Adjusted font size
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.016),
            // New text view with the specified design
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.1), // Adjusted margin
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(
                      height: 1.25,
                      color: Color(0xFF313131),
                      fontFamily: 'Inter',
                      fontSize: mediaQuery.height * 0.016, // Adjusted font size
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                  Text(
                    '$_characterCount/100',
                    style: TextStyle(
                      color: Color(0xFF313131),
                      fontFamily: 'Inter',
                      fontSize: mediaQuery.height * 0.016, // Adjusted font size
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.008),
            // Box with the specified design
            Padding(
              padding: EdgeInsets.fromLTRB(mediaQuery.width * 0.1, 0, mediaQuery.width * 0.05, 0), // Adjusted margins
              child: Container(
                height: mediaQuery.height * 0.18, // Adjusted height
                width: mediaQuery.width * 0.8, // Adjusted width
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFACACAC), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: _textController,
                  onChanged: (text) {
                    setState(() {
                      _characterCount = text.length;
                    });
                    if (_characterCount > 100) {
                      _textController.text = _textController.text.substring(0, 100);
                      _textController.selection = TextSelection.collapsed(offset: 100);
                      setState(() {
                        _characterCount = 100;
                      });
                    }
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter your notes...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.016),
            // Button with the specified design
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.1), // Adjusted margin
              child: ElevatedButton(
                onPressed: () {
                  // Add your button press logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5AA441),
                  side: BorderSide(color: Color(0xFFACACAC), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Container(
                  height: mediaQuery.height * 0.04, // Adjusted height
                  width: mediaQuery.width * 0.8, // Adjusted width
                  alignment: Alignment.center,
                  child: Text(
                    'Save', // Your button text
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: mediaQuery.height * 0.016, // Adjusted font size
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: mediaQuery.height * 0.016),
            // Container with the specified design
            Container(
              height: mediaQuery.height * 0.1, // Adjusted height
              width: mediaQuery.width, // Adjust width to match screen width
              color: Color(0xFFF2F4F5),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.1), // Adjusted margin
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button press logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Color(0xFF174571), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Container(
                      height: mediaQuery.height * 0.04, // Adjusted height
                      width: mediaQuery.width * 0.8, // Adjusted width
                      alignment: Alignment.center,
                      child: Text(
                        'Clear', // Your button text
                        style: TextStyle(
                          color: Color(0xFF174571),
                          fontFamily: 'Inter',
                          fontSize: mediaQuery.height * 0.016, // Adjusted font size
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                        ),
                      ),
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
