import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbook/models/users_list.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/screens/garderners_profile_page.dart';
import 'package:greenbook/services/user_services.dart';
import 'package:provider/provider.dart';

class GardenersPage extends StatefulWidget {
  const GardenersPage({super.key});

  @override
  State<GardenersPage> createState() => _GardernersPageState();
}

class _GardernersPageState extends State<GardenersPage> {
  List<UsersList> usersList = [];

  @override
  void initState() {
    fetchUserList();
    super.initState();
  }

  void fetchUserList() async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    usersList = await UserServices.fetchUsers(user.email);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text(
            'Gardeners',
            style: GoogleFonts.manrope(
              color: const Color(0xFF000066),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: 2,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                  fillColor: Colors.white.withOpacity(0.8),
                  hintText: 'Search by Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1, color: Colors.grey
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    fetchUserList();
                  },
                  child: CustomScrollView(
                    slivers: [
                      // SliverGrid.count(
                      //   crossAxisCount: 3,
                      //   mainAxisSpacing: 10.0,
                      //   crossAxisSpacing: 10.0,
                      //   childAspectRatio: 1 / 1.3,
                      //   children: List.generate(24, (index) {
                      //     return const GardenerGridBox();
                      //   }),
                      // ),
                      SliverGrid.builder(
                        itemCount: usersList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1 / 1.1,
                        ), 
                        itemBuilder: (context, index) {
                           return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => GardenersProfilePage(userId: usersList[index].id)));
                            },
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
                                      backgroundImage: AssetImage('backend/images/${usersList[index].profilePicture}')
                                    ),
                                  ),
                                  Text(
                                    usersList[index].name,
                                    style: GoogleFonts.manrope(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                      letterSpacing: 0.50,
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(horizontal: 2),
                                  //   child: SizedBox(
                                  //     height: 25,
                                  //     child: ElevatedButton(
                                  //       onPressed: () {},
                                  //       child: Text(
                                  //         'Following',
                                  //         style: GoogleFonts.manrope(
                                  //           fontSize: 10,
                                  //           fontWeight: FontWeight.w700,
                                  //           height: 0,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                                                     ),
                           );
                        }
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
