import 'package:farmwise/farmerScreens/createProposal.dart';
import 'package:farmwise/farmerScreens/createProductProposal.dart';
import 'package:farmwise/farmerScreens/myIncome.dart';
import 'package:farmwise/farmerScreens/verificationForgot.dart';
import 'package:farmwise/mainScreens/forgotPassword.dart';
import 'package:farmwise/mainScreens/login.dart';
import 'package:farmwise/mainScreens/newPassword.dart';
import 'package:farmwise/mainScreens/registerSelection.dart';
import 'package:device_preview/device_preview.dart';
import 'package:farmwise/buyerScreens/buyerDashboard.dart';
import 'package:farmwise/farmerScreens/farmerDashboard.dart';
import 'package:farmwise/investorScreens/dashboardInvestor.dart';
import 'package:farmwise/mainScreens/homePage.dart';
import 'package:farmwise/mainScreens/splashScreen.dart';
import 'package:farmwise/services/logout.dart';
import 'package:farmwise/test.dart';
import 'package:farmwise/test3.dart';
import 'package:flutter/material.dart';
import '../services/auth_services.dart';
import 'package:farmwise/farmerScreens/verificationForgot.dart';
import 'test2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AuthService _authService = AuthService();
  String token = await _authService.getToken();
  String role = await _authService.getRole();
  String email = await _authService.getEmail();
  runApp(
    DevicePreview(
      builder: (context) =>
          MyApp(token: token, role: role, email: email), // Wrap your app
    ),
  );
  // runApp(MyApp(token: token, role: role, email: email));
}

// RGB value for green: 0xRRGGBB

class MyApp extends StatefulWidget {
  final String token;
  final String role;
  final String email;

  const MyApp({required this.token, required this.role, required this.email});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print(widget.token);
    print(widget.role);
    print(widget.email);
    final Color customGreenColor = Colors.green.shade700;

    String? initialIdentifier;
    if (widget.token == 'none' && widget.role == 'none') {
      initialIdentifier = '/';
    } else if (widget.token != 'none' && widget.role == 'farmer') {
      initialIdentifier = '/farmerDash';
    } else if (widget.token != 'none' && widget.role == 'investor') {
      initialIdentifier = '/investorDash';
    } else if (widget.token != 'none' && widget.role == 'buyer') {
      initialIdentifier = '/buyerDash';
    } else {
      initialIdentifier = '/';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 13, 55, 16),
        ),
        hintColor: Color.fromARGB(255, 76, 72, 76),
        brightness: Brightness.light,
        primaryColor: customGreenColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color.fromARGB(255, 5, 46, 2),
        ),
      ),
      // initialRoute: '/test3',
      initialRoute: initialIdentifier,
      routes: {
        '/': (context) => const Homepage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const registerSelection(),
        '/farmerDash': (context) => const FarmerDashboard(),
        "/investorDash": (context) => const DashboardInvestor(),
        '/buyerDash': (context) => const buyerDashboard(),
        '/logout': (context) => const Logout(),
        '/test2': (context) => Test2(),
        '/forgot': (context) => ForgotPassword(),
        '/verification': (context) => VerificationForgot(),
        '/newPassword': (context) => NewPassword(),
        '/test3': (context) => Test3(),
      },
    );
  }
}
