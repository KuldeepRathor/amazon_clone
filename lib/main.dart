// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:amazon_clone/features/home/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/widgets/bottom_bar.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    debugPrint("getUserData called from initState");
    GetToken();
    // authService.getUserData(context);
  }

  GetToken() async {
    await authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Building MyApp");
    final userProvider = Provider.of<UserProvider>(context);
    // print("User token: ${userProvider.user.token}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(
        settings,
      ),
      home: context.watch<UserProvider>().user.token != ""
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? BottomBar()
              :
              // BottomBar()
              AdminScreen()
          : AuthScreen(),
    );
  }
}
