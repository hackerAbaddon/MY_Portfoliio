import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/controller/dashboard_controller.dart';


Widget bioData(DashboardNotifier myData) {
  FlutterTts flutterTts = FlutterTts();

  void speakText() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(
        'Hi, I\'m Vinayak. Graduate from Lords University with Computer Science having wide array of experiences ranging from web Development, App development, Adopting new tech, Coordination and Consultancy regarding execution of Online business. 1+ years of Experience in building full stack applications and websites.');
  }

  return Stack(
    children: [
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Know me',
                      style: GoogleFonts.getFont(myData.currentFamily).copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      myData.closeScreen();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: Container(
                  height: 450,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          7.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    color: Color.lerp(Color(0xff1b1c16),
                        myData.colors[myData.currentbackground]['color'], 0.05),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Container(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset('assets/images/port.png')),
                        ),
                        SizedBox(height: 10),
                        Text('Hi, I\'m Vinayak Sharma',
                            style: GoogleFonts.getFont(myData.currentFamily)
                                .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: GoogleFonts.getFont(myData.currentFamily)
                                    .copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                )),
                            Container(
                              width: 203,
                              child: Text(
                                  'Graduate from Lords University with Computer Science having wide array of experiences ranging from web Development, App development, Adopting new tech with Problem Solving skill ',
                                  style: GoogleFonts.getFont(myData.currentFamily)
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                            ),
                          ],
                        ),
                                           ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 20, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.lerp(Color(0xff1b1c16),
                  myData.colors[myData.currentbackground]['color'], 0.5),
            ),
            child: IconButton(
              icon: Icon(
                Icons.volume_down_alt,
                color: Colors.white,
              ),
              onPressed: () {
                speakText();
              },
            ),
          ),
        ),
      ),
    ],
  );
}
