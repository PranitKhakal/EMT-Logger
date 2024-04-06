import 'package:flutter/material.dart';
import '../sqlmethods/sql_helper.dart';

class DispatchDetail extends StatefulWidget {
  final String timestamp;

  const DispatchDetail({Key? key, required this.timestamp}) : super(key: key);

  @override
  _DispatchDetailState createState() => _DispatchDetailState();
}

class _DispatchDetailState extends State<DispatchDetail> {
  final TextEditingController _textController = TextEditingController();
  int _characterCount = 0;

  Future<void> _addNote() async {
    await SQLHelper.createNotes("dispatch", _textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Back to Home',
          style: TextStyle(
            height: 1.0,
            color: const Color(0xFFC80605),
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/logo.PNG',
              width: 40,
              height: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Dispatched',
                style: TextStyle(
                  height: 1.0,
                  color: Color(0xFF1A4191),
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date and Time:',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  // Your button press logic here
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
                  height: 40,
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    widget.timestamp,
                    style: TextStyle(
                      color: Color(0xFF313131),
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(
                      height: 1.25,
                      color: Color(0xFF313131),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                  Text(
                    '$_characterCount/100',
                    style: TextStyle(
                      color: Color(0xFF313131),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 32, 0), // Updated padding
              child: Container(
                height: 237,
                width: MediaQuery.of(context).size.width,
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
                      _textController.text =
                          _textController.text.substring(0, 100);
                      _textController.selection =
                          TextSelection.collapsed(offset: 100);
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
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () async {
                  await _addNote();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5AA441),
                  side: BorderSide(color: Color(0xFFACACAC), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Container(
                  height: 40,
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFF2F4F5),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      _textController.clear();
                      setState(() {
                        _characterCount = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Color(0xFF174571), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Container(
                      height: 40,
                      width: 300,
                      alignment: Alignment.center,
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          color: Color(0xFF174571),
                          fontFamily: 'Inter',
                          fontSize: 16,
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

void main() {
  runApp(MaterialApp(
    home: DispatchDetail(timestamp: "Timestamp"),
  ));
}
