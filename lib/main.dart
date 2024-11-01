import 'package:flutter/material.dart';
import 'package:flutter_hang_without_async/constants.dart';
import 'package:flutter_hang_without_async/data/mock_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final mockApi = MockApi();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isUserLoggedIn = false;

  void onPress() async {
    setState(() {
      isLoading = true;
    });

    isUserLoggedIn = await widget.mockApi.loginUser();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isLoading) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : onPress,
              child: Text(isUserLoggedIn ? 'Logout User' : 'Login User'),
            ),
            const SizedBox(height: 8),
            Text(isUserLoggedIn ? "User logged in" : "User logged OUT")
          ],
        ),
      ),
    );
  }
}
