import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/providers/story_provider.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/screens/create_story_page.dart';
import 'package:greenbook/services/story_services.dart';
import 'package:greenbook/widgets/custom_primary_filled_button.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final StoryService storyService = StoryService();

  @override
  void initState() {
    fetchStory();
    super.initState();
  }

  void fetchStory() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    storyService.getStory(
      context: context,
      id: user.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final story = Provider.of<StoryProvider>(context).story;

    // fetchStory();

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
      body: SafeArea(
        child: Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              fetchStory();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage:
                        AssetImage("backend/images/${user.profilePicture}"),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("${user.followers.length}"),
                          const Text("Followers"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("${user.following.length}"),
                          const Text("Following"),
                        ],
                      ),
                      const Column(
                        children: [
                          Text("0"),
                          Text("Donations"),
                        ],
                      ),
                    ],
                  ),
                  // Container(
                  //   width: 350,
                  //   height: 1,
                  //   margin: const EdgeInsets.all(10),
                  //   decoration: const BoxDecoration(color: Color(0x541E1E1E)),
                  // ),
                  const Divider(
                    height: 15,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                  ),
                  story.id != '' ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: Container(
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
                      ),
                      // About
                      Card(
                        margin: const EdgeInsets.all(30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  story.title,
                                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  story.body,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.thumb_up),
                                ),
                                Text(
                                  story.likes.length.toString(),
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
                      ),
                    ],
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/jungle-page-not-found-1.png",
                          ),
                          Center(
                            child: CustomPrimaryFilledButton(
                                text: 'Create Story',
                                width: 325,
                                height: 60,
                                textSize: 18,
                                onPressed: () {
                                  Navigator.of(context).push((MaterialPageRoute(
                                    builder: (ctx) => const CreateStory(),
                                  )));
                                }
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
