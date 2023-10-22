// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/models/gardener_profile.dart';
import 'package:greenbook/providers/story_provider.dart';
import 'package:greenbook/services/story_services.dart';
import 'package:greenbook/services/user_services.dart';
import 'package:greenbook/widgets/custom_floating_action_button.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_primary_filled_button.dart';
import '../widgets/custom_primary_outlined_button.dart';

class GardenersProfilePage extends StatefulWidget {
  // const GardenersProfilePage({super.key});

  final String loggedInUserId;
  final String userId;
  final Key? key;

  const GardenersProfilePage({
    required this.loggedInUserId,
    required this.userId,
    this.key,
  }) : super(key: key);

  @override
  State<GardenersProfilePage> createState() => _GardenersProfilePageState();
}

class _GardenersProfilePageState extends State<GardenersProfilePage> {
  bool isEnabled = false;
  bool isFollowing = false;

  GardenerProfile gardenerDetails= GardenerProfile(
    id: '', 
    name: '', 
    email: '', 
    username: '', 
    profilePicture: '', 
    followers: [], 
    following: []
  );

  final StoryService storyService = StoryService();

  @override
  void initState() {
    fetchUserDetails();
    fetchStory();
    super.initState();
  }

  void fetchUserDetails() async {
    gardenerDetails = await UserServices.fetchGardenerById(widget.userId);
    setState(() {});
  }

  void fetchStory() {
    storyService.getStory(
      context: context,
      id: widget.userId,
    );
    setState(() {});
  }

  void followUser() async {
    await UserServices.followUser(widget.loggedInUserId, widget.userId);
    setState(() {});
  }

  void unfollowUser() async {
    await UserServices.unfollowUser(widget.loggedInUserId, widget.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final story = Provider.of<StoryProvider>(context).story;

    // fetchStory();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          gardenerDetails.username,
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
              fetchUserDetails();
              fetchStory();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage:
                    AssetImage('backend/images/${gardenerDetails.profilePicture}'),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        gardenerDetails.name,
                        style: GoogleFonts.manrope(
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
                          Text(gardenerDetails.followers.length.toString()),
                          const Text("Followers"),
                        ],
                      ),
                      Column(
                        children: [
                          Text(gardenerDetails.following.length.toString()),
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: gardenerDetails.followers.contains(widget.loggedInUserId) ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomPrimaryFilledButton(text: "Unfollow", width: 150, height: 40, textSize: 20, onPressed: () {unfollowUser();}),
                        CustomPrimaryOutlinedButton(text: "Donate", width: 150, height: 40, textSize: 20, onPressed: () {})
                      ],
                    ) :
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomPrimaryFilledButton(text: "Follow", width: 150, height: 40, textSize: 20, onPressed: () {followUser();}),
                        CustomPrimaryOutlinedButton(text: "Donate", width: 150, height: 40, textSize: 20, onPressed: () {})
                      ],
                    ),
                  ),
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
                              image: AssetImage('backend/images/${story.bannerPicture}'),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      // About
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 30.0, vertical: 10.0),
                      //   child: Text(
                      //     story.body,
                      //     style: const GoogleFonts.manrope(fontSize: 16.0),
                      //     textAlign: TextAlign.justify,
                      //   ),
                      // ),
                      Card(
                        margin: EdgeInsets.all(30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  story.title,
                                  style: GoogleFonts.manrope(fontSize: 24.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  story.body,
                                  style: GoogleFonts.manrope(fontSize: 16.0),
                                ),
                                // Add more content or widgets here
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
                  ) : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/jungle-page-not-found-1.png",
                          ),
                          Text(
                            'No Story Available to Show!',
                            style: GoogleFonts.manrope(
                              fontSize: 20
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom:50),
        child: CustomFloatingActionButton(),
      ),
    );
  }
}
