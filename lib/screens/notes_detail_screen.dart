import 'package:flutter/material.dart';
import 'package:notes_app/constants/my_app_icons.dart';
import 'package:notes_app/screens/notes_screen.dart';
import 'package:notes_app/widgets/my_icon_widget.dart';

class NotesDetailScreen extends StatelessWidget {
  const NotesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const NotesScreen(),
          Container(color: Colors.black.withValues(alpha: 0.6)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(25),
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Transform.rotate(
                          angle: 0.80,
                          child: MyIconWidget(
                            icon: MyAppIcons.pin,
                            function: () {},
                            backgroundColor: Color(0xffbAD6139),
                          ),
                        ),
                        SizedBox(width: 15),
                        MyIconWidget(
                          icon: MyAppIcons.edit,
                          function: () {},
                          backgroundColor: Color(0xffb314290),
                        ),
                        SizedBox(width: 15),
                        MyIconWidget(
                          icon: MyAppIcons.search,
                          function: () {},
                          backgroundColor: Colors.green,
                        ),
                        Spacer(),
                        MyIconWidget(
                          icon: MyAppIcons.delete,
                          function: () {},
                          backgroundColor: Colors.red,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color(0xffbFAF7ED),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Notes'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Football And Tennis',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '28/7/2022',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "I enjoy researching, communicating with people, and finding creative ways to solve problems. I believe these skills are very important in business development — especially when it comes to identifying potential clients and helping a company expand its reach.while improving my own skills in marketing, communication, and teamwork.I want to learn how business development works in real companies — from researching leads to communicating with clients and closing deals. I also want to gain practical experience in using professional tools and strategies.Because I’m a fast learner, dedicated, and have strong communication and research skills. I’m confident I can quickly adapt, understand your business goals, and help your team in generating and managing leads effectively.",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
