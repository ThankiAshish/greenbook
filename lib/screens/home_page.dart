import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/models/latest_story.dart';
import 'package:greenbook/models/users_list.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/screens/gardeners_page.dart';
import 'package:greenbook/screens/garderners_profile_page.dart';
import 'package:greenbook/screens/leaderboard_page.dart';
import 'package:greenbook/screens/profile_page.dart';
import 'package:greenbook/services/user_services.dart';
import 'package:greenbook/services/story_services.dart';
import 'package:greenbook/widgets/custom_floating_action_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasLikedLatestStory = false;

  List<UsersList> usersList = [];

  LatestStory story = LatestStory(
    id: '', 
    title: '', 
    body: '', 
    likes: [], 
    bannerPicture: '', 
    userId: ''
  );

  @override
  void initState() {
    fetchUserList();
    fetchLatestStory();
    super.initState();
  }

  void fetchUserList() async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    usersList = await UserServices.fetchLatestUsers(user.email);
    setState(() {});
  }

  void fetchLatestStory() async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    story = await StoryService.fetchLatestStory(user.id);
    hasLikedLatestStory = story.likes.contains(user.id);
    setState(() {});
  }

  void likeUserStory() async {
    setState(() {
      hasLikedLatestStory = true;
    });
    final user = Provider.of<UserProvider>(context, listen: false).user;
    await StoryService.likeStory(user.id, story.userId);
  }

  void unlikeUserStory() async {
    setState(() {
      hasLikedLatestStory = false;
    });
    final user = Provider.of<UserProvider>(context, listen: false).user;
    await StoryService.unlikeStory(user.id, story.userId);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${user.username}!',
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                height: 0,
                letterSpacing: 1.40,
              ),
            ),
            Text(
              '${user.points} Points',
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 1.40,
              ),
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push((MaterialPageRoute(
                builder: (ctx) => const ProfilePage(),
              )));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ClipOval(
                child: Image.asset(
                  "backend/images/${user.profilePicture}",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SearchAnchor.bar(
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<Widget>.generate(
                5,
                (int index) {
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Initial list item $index'),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            // width: 380,
            height: 140,
            decoration: ShapeDecoration(
              color: Colors.green.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Ranking',
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF20411B),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.70,
                            ),
                          ),
                          Text(
                            '#7803',
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF233F1E),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        // width: 120,
                        // height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => const LeaderboardPage(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            // backgroundColor:
                            //     MaterialStateProperty.all<Color>(const Color(0xFFF3F3F3)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          child: Text(
                            'Leaderboard',
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/bannerimage.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Gardeners',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.70,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push((MaterialPageRoute(
                        builder: (ctx) => const GardenersPage(),
                      )));
                    },
                    child: Text(
                      'View All',
                      style: GoogleFonts.manrope(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 140,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < usersList.length; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => GardenersProfilePage(loggedInUserId:  user.id, userId: usersList[i].id)));
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: ShapeDecoration(
                            color: Colors.green.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('backend/images/${usersList[i].profilePicture}')
                                ),
                              ),
                              Text(
                                usersList[i].name,
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                  letterSpacing: 0.50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                Text(
                  'Latest Story',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.70,
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GardenersProfilePage(loggedInUserId:  user.id, userId: story.userId)));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.green.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  story.title,
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                hasLikedLatestStory ?
                                    IconButton(
                                      onPressed: () {
                                        unlikeUserStory();
                                      },
                                      icon: const Icon(Icons.favorite, color: Colors.red),
                                    ) :
                                    IconButton(
                                      onPressed: () {
                                        likeUserStory();
                                      },
                                      icon: const Icon(Icons.favorite_border_outlined, color: Colors.black),
                                    ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom:50),
        child: CustomFloatingActionButton(),
      ),
    );
  }
}
