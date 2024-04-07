// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardNotifier with ChangeNotifier {
  List icons = [
    {
      'icon': 'assets/icons/about.png',
      'color': Color(0xff008080),
      'text': 'About me',
      'function': 'aboutme',
    },
    {
      'icon': 'assets/icons/linkedn.png',
      'color': Color(0xff0A66C2),
      'text': 'Linkedn',
      'function': 'linkedn',
    },
    {
      'icon': 'assets/icons/instagram.png',
      'color': Color(0xffE1306C),
      'text': 'Instagram',
      'function': 'instagram',
    },
    {
      'icon': 'assets/icons/fb.png',
      'color': Colors.blue,
      'text': 'Facebook',
      'function': 'fb',
    },
    {
      'icon': 'assets/icons/medium.png',
      'color': Colors.black,
      'text': 'Medium',
      'function': 'medium',
    },
    {
      'icon': 'assets/icons/github.png',
      'color': Colors.black,
      'text': 'Github',
      'function': 'github',
    },
    {
      'icon': 'assets/icons/email.png',
      'color': Colors.red,
      'text': 'Email',
      'function': 'email',
    },
    {
      'icon': 'assets/icons/fontfamily.png',
      'color': Colors.deepPurple,
      'text': 'Font Family',
      'function': 'changefonts',
    },
    // {
    //   'icon': 'assets/icons/design.png',
    //   'color': Colors.lightBlue,
    //   'text': 'Free UI Kits',
    //   'function': 'changefonts',
    // },
  ];

  List colors = [
    {'color': Color(0xffff0066), 'backimage': 'assets/images/back1.png'},
    {'color': Color(0xffB0235F), 'backimage': 'assets/images/back2.png'},
    {'color': Color(0xffA7233A), 'backimage': 'assets/images/back3.png'},
    {'color': Color(0xff0066FF), 'backimage': 'assets/images/back4.png'},
    {'color': Color(0xff297EA6), 'backimage': 'assets/images/back5.png'},
    {'color': Color(0xff00CC8E), 'backimage': 'assets/images/back6.png'},
  ];

  int currentbackground = Random().nextInt(5);
  String currentFamily = 'Quicksand';
  String currentPage = 'homepage';
  String currentPhone = "ios";
  void changeDefault(int index) {
    currentbackground = index;
    notifyListeners();
  }

  void closeScreen() {
    currentPage = 'homepage';
    notifyListeners();
  }

  void changePage(String page) {
    currentPage = page;
    notifyListeners();
  }

  void changephone(String phone) {
    currentPhone = phone;
    notifyListeners();
  }

  List fonts = ['Quicksand', 'Poppins', 'Lato', 'Roboto', 'Oswald'];
  void changeFont() {
    currentFamily = fonts[Random().nextInt(5)];
    notifyListeners();
  }

  void functions(String type, BuildContext context) {
    switch (type) {
      case 'changefonts':
        {
          changeFont();
          notifyListeners();
        }
        break;
      case 'aboutme':
        {
          AboutmeBox(context);
          notifyListeners();
        }
        break;
      case 'instagram':
        {
          launchUrlInNewTab('https://www.instagram.com/sharmavinayak7878/');
          notifyListeners();
        }
        break;
      case 'github':
        {
          launchUrlInNewTab('https://github.com/hackerAbaddon');
          notifyListeners();
        }
        break;
      case 'medium':
        {
          launchUrlInNewTab('https://medium.com/@vinayaksharma135017');
          notifyListeners();
        }
        break;
      case 'fb':
        {
          launchUrlInNewTab('https://www.facebook.com/profile.php?id=100050905399934');
          notifyListeners();
        }
        break;
      case 'email':
        {
          launchEmail('vinayaksharma135017@gmail.com', 'Let\'s talk', 'Hi Vinayak');
          notifyListeners();
        }
      case 'linkedn':
        {
          launchUrlInNewTab('www.linkedin.com/in/vinayak-sharma-7273912a0');
          notifyListeners();
        }
        break;
    }
  }

  void launchUrlInNewTab(String url) async {
    // Check if the URL is valid
    if (await canLaunch(url)) {
      // Launch the URL in a new tab
      await launch(
        url,
        webOnlyWindowName: '_blank',
      );
    } else {
      // Handle error
      print('Could not launch $url');
    }
  }

  void launchEmail(String toEmail, String subject, String body) async {
    // Create the mailto URL
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    // Check if the URL can be launched
    if (await canLaunch(emailLaunchUri.toString())) {
      // Launch the email app
      await launch(emailLaunchUri.toString());
    } else {
      // Handle error
      print('Could not launch email');
    }
  }

  List experience = [
    {
      'title': 'Flutter App Developer',
      'company': 'Zuluitsolution',
      'date': 'Apr 2023 - Present, Alwar, Rajasthan, India',
      'isexpanded': false,
      'ishover': false,
      'data': [
      
      
  'Proficient in Flutter framework for cross-platform mobile app development',
'Strong understanding of Dart programming language',
'Experience with UI/UX design implementation',
'Knowledge of state management techniques (Provider, Bloc, Redux)',
'Familiarity with RESTful APIs integration',
'Experience with version control systems (Git)',
'Problem-solving and debugging skills',
'Ability to work collaboratively in an Agile development environment',
     ]
    },
  ];

  void changeExpand(int index, bool expanded) {
    experience[index]['isexpanded'] = expanded;
    notifyListeners();
  }

  void hoverin(index) {
    experience[index]['ishover'] = true;
    notifyListeners();
  }

  void hoverout(index) {
    experience[index]['ishover'] = false;
    notifyListeners();
  }

  List skillsdata = [
    {
      'title': "Languages",
      'data': [
        'Flutter',
        'Nodejs',
        'Firebase',
       'REST API',
        
        'MVC',
        'Spring Boot',
        'Git',
        
        'OOP',
        'MongoDB',
        'MySql',
       
      ]
    },
    {
      'title': '',
      'data': [
      ]
    },
  ];

  String formatTime(DateTime dateTime) {
    // Extract hours and minutes
    int hours = dateTime.hour;
    int minutes = dateTime.minute;

    // Determine AM/PM
    String period = (hours >= 12) ? 'PM' : 'AM';

    // Convert to 12-hour format
    if (hours > 12) {
      hours -= 12;
    } else if (hours == 0) {
      hours = 12;
    }

    // Format the time string
    String formattedTime =
        '$hours:${minutes.toString().padLeft(2, '0')} $period';

    return formattedTime;
  }

  String formatTimeIos(DateTime dateTime) {
    // Extract hours and minutes
    int hours = dateTime.hour;
    int minutes = dateTime.minute;

    // Determine AM/PM
    String period = (hours >= 12) ? '' : '';

    // Convert to 12-hour format
    if (hours > 12) {
      hours -= 12;
    } else if (hours == 0) {
      hours = 12;
    }

    // Format the time string
    String formattedTime =
        '$hours:${minutes.toString().padLeft(2, '0')} $period';

    return formattedTime;
  }

  String formatDateTime(DateTime dateTime) {
    // List of month abbreviations
    final List<String> monthAbbreviations = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // List of day abbreviations
    final List<String> dayAbbreviations = [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat'
    ];

    // Extract day, date, and month
    int dayOfWeek = dateTime.weekday;
    int dayOfMonth = dateTime.day;
    int month = dateTime.month;

    // Format the string
    String formattedDateTime =
        '${dayAbbreviations[dayOfWeek - 1]}, ${dayOfMonth.toString().padLeft(2, '0')} ${monthAbbreviations[month - 1]}';

    return formattedDateTime;
  }

  String formatDateTimeIos(DateTime dateTime) {
    // List of month names
    final List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    // List of day names
    final List<String> dayNames = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];

    // Extract day, date, and month
    int dayOfWeek = dateTime.weekday;
    int dayOfMonth = dateTime.day;
    int month = dateTime.month;

    // Format the string
    String formattedDateTime =
        '${dayNames[dayOfWeek - 1]}, ${dayOfMonth.toString().padLeft(2, '0')} ${monthNames[month - 1]}';

    return formattedDateTime;
  }
}

class AboutmeBox {
  BuildContext ctx;

  AboutmeBox(
    this.ctx,
  ) {
    showDialogNew();
  }

  Future<void> showDialogNew() async {
    return showDialog<void>(
      context: this.ctx,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white.withOpacity(0.2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            alignment: Alignment.center,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            insetPadding: EdgeInsets.symmetric(horizontal: 15),
            title: Center(
                child: Text(
              'About me',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
            content: Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  aboutme(
                    context,
                    'assets/images/port.png',
                    'Bio',
                    callback: (p0) {
                      Provider.of<DashboardNotifier>(context, listen: false)
                          .changePage('aboutme');
                      Navigator.pop(context);
                    },
                  ),
                  aboutme(
                    context,
                    'assets/icons/experience.png',
                    'Experience',
                    backcolor: Colors.blue,
                    color: Colors.white,
                    callback: (p0) {
                      Provider.of<DashboardNotifier>(context, listen: false)
                          .changePage('experience');
                      Navigator.pop(context);
                    },
                  ),
                  aboutme(
                    context,
                    'assets/icons/skills.png',
                    'Skills',
                    backcolor: Colors.pink,
                    color: Colors.white,
                    callback: (p0) {
                      Provider.of<DashboardNotifier>(context, listen: false)
                          .changePage('skills');
                      Navigator.pop(context);
                    },
                  ),
                  aboutme(
                    context,
                    'assets/icons/education.png',
                    'Education',
                    backcolor: Colors.purple,
                    color: Colors.white,
                    callback: (p0) {
                      Provider.of<DashboardNotifier>(context, listen: false)
                          .changePage('education');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            contentTextStyle: TextStyle(
              height: 1.4,
              color: Colors.black,
              fontSize: 14,
            ),
            actions: <Widget>[],
          );
        });
      },
    );
  }

  Widget aboutme(context, String image, String text,
      {Color? color = null,
      Color? backcolor = Colors.white,
      void Function(BuildContext)? callback}) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback(ctx);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    7.0, // Move to bottom 10 Vertically
                  ),
                )
              ], color: backcolor, borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                color: color,
              )),
          SizedBox(height: 5),
          Text(
            text,
            style: GoogleFonts.getFont(
                    Provider.of<DashboardNotifier>(context, listen: false)
                        .currentFamily)
                .copyWith(
              color: Colors.white,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
