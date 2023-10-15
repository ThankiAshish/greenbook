import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/providers/story_provider.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/services/story_services.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final StoryService storyService = StoryService();

  // @override
  // void initState() {
  //   fetchStory();
  //   super.initState();
  // }

  void fetchStory() {
    final user = Provider.of<UserProvider>(context).user;
    storyService.getStory(
      context: context,
      id: user.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final story = Provider.of<StoryProvider>(context).story;

    fetchStory();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Profile',
            style: GoogleFonts.manrope(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 2,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "backend/images/${user.profilePicture}",
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: GoogleFonts.manrope(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                height: 0,
                                letterSpacing: 2.20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '6.5K',
                                      style: GoogleFonts.manrope(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 1.20,
                                      ),
                                    ),
                                    Text(
                                      'Followers',
                                      style: GoogleFonts.manrope(
                                        color: const Color(0xFF20411B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '386',
                                      style: GoogleFonts.manrope(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 1.20,
                                      ),
                                    ),
                                    Text(
                                      'Following',
                                      style: GoogleFonts.manrope(
                                        color: const Color(0xFF20411B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '10',
                                      style: GoogleFonts.manrope(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 1.20,
                                      ),
                                    ),
                                    Text(
                                      'Donations',
                                      style: GoogleFonts.manrope(
                                        color: const Color(0xFF20411B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        height: 0,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 350,
                        height: 1,
                        margin: const EdgeInsets.all(10),
                        decoration:
                            const BoxDecoration(color: Color(0x541E1E1E)),
                      ),
                      Container(
                        width: 340,
                        height: 200,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "backend/images/${story.bannerPicture}"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          story.body,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const IconButton(
                                onPressed: null,
                                icon: Icon(Icons.thumb_up),
                              ),
                              Text(
                                'XXKM',
                                style: GoogleFonts.manrope(
                                  color: const Color(0xFF23401E),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const IconButton(
                                onPressed: null,
                                icon: Icon(Icons.share),
                              ),
                              Text(
                                'Share',
                                style: GoogleFonts.manrope(
                                  color: const Color(0xFF23401E),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const IconButton(
                                onPressed: null,
                                icon: Icon(Icons.edit),
                              ),
                              Text(
                                'Edit',
                                style: GoogleFonts.manrope(
                                  color: const Color(0xFF23401E),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
