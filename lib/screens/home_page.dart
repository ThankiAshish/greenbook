import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/screens/gardeners_page.dart';
import 'package:greenbook/screens/leaderboard_page.dart';
import 'package:greenbook/screens/profile_page.dart';
import 'package:greenbook/widgets/gardener_grid_box.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.34202014, -1.3),
          end: Alignment(-0.11, 10.0),
          colors: [Colors.white, Color(0x66D3FF76)],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, ${user.username}!',
                style: GoogleFonts.manrope(
                  color: const Color(0xFF20411B),
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 0,
                  letterSpacing: 1.40,
                ),
              ),
              Text(
                'X Points',
                style: GoogleFonts.manrope(
                  color: const Color(0xFF000066),
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
                Navigator.of(context).push((MaterialPageRoute(builder: (ctx)=> const ProfilePage(),)));
              },
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  hintText: 'What are you Looking for?',
                  hintStyle: GoogleFonts.manrope(
                    color: const Color(0xFF20411B),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    height: 0,
                    letterSpacing: 1.80,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey
                    ),
                  ),
                ),         
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 380,
              height: 140,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff306028), Color(0x0051ff00)],
                  stops: [0, 1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        width: 120,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const LeaderboardPage(),),);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(const Color(0xFFF3F3F3)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          child: Text(
                            'Leaderboard',
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF000066),
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
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gardeners',
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF000066),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: 0.70,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push((MaterialPageRoute(builder: (ctx)=> const GardenersPage(),)));
                        },
                        child: Text(
                          'View All',
                          style: GoogleFonts.manrope(
                            color: const Color(0xFF000066),
                            fontSize: 8,
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
                  height: 120,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(int i = 0; i < 10; i++)
                        GestureDetector(
                          onTap: null,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const GardenerGridBox(),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Popular Story',
                        style: GoogleFonts.manrope(
                        color: const Color(0xFF000066),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.70,
                        ),
                      ),
                    ]
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 380,
                  height: 270,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff306028), Color(0x0051ff00)],
                      stops: [0, 1],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage('assets/images/user.png')
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Username',
                                  style: GoogleFonts.manrope(
                                    color: const Color(0xFF23401E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                              height: 25,
                              child: ElevatedButton(
                                onPressed: (){
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const RegisterPage(),),);
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(const Color(0xFFF3F3F3)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Follow',
                                  style: GoogleFonts.manrope(
                                    color: const Color(0xFF000066),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Diam et rebum accusam iriure eu. Eirmod labore takimata labore consetetur eos dolor esse iusto duo voluptua sea magna et tempor no ad lorem wisi. Clita lorem est consequat sit et duo duis in minim ipsum sit takimata amet labore takimata et diam rebum. Et ut sed dolores no. Diam blandit volutpat et ut dolores. Et takimata sea. Elitr lorem iusto lobortis diam nulla takimata lorem at lorem erat et elit aliquyam. Et voluptua augue et justo eirmod lorem takimata. Zzril voluptua diam lorem. Eos suscipit sadipscing consetetur nihil sed vero facer. Sanctus clita iusto vel labore velit elitr et sed doming diam facilisis dolor et rebum possim. Justo erat nonumy sea ea aliquyam sea aliquam ipsum ipsum vulputate...',
                                style: GoogleFonts.manrope(
                                  color: Colors.black,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const IconButton(onPressed: null, icon: Icon(Icons.thumb_up, color: Colors.black,)),
                                  Text(
                                    'XXKM Likes',
                                    style: GoogleFonts.manrope(
                                      color: const Color(0xFF23401E),
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                ]
                              ),
                              Row(
                                children: [
                                  const IconButton(onPressed: null, icon: Icon(Icons.comment, color: Colors.black,)),
                                  Text(
                                    'XX Comments',
                                    style: GoogleFonts.manrope(
                                      color: const Color(0xFF23401E),
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                ]
                              ),
                              Row(
                                children: [
                                  const IconButton(onPressed: null, icon: Icon(Icons.share, color: Colors.black,)),
                                  Text(
                                    'Share',
                                    style: GoogleFonts.manrope(
                                      color: const Color(0xFF23401E),
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                ]
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: currIndex,
          onTap: (int index) {
            setState(() {
              currIndex = index;
            });
          },
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}