import 'package:flutter/material.dart';
import 'package:greenbook/providers/story_provider.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/screens/home_page.dart';
import 'package:greenbook/screens/welcome_page.dart';
import 'package:greenbook/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => StoryProvider()),
  ], child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const HomePage()
            : const WelcomePage()
        // home: const CreateStory(),
        );
  }
}
