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
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool isUserLoggedIn = false;

  void onPress() async {
    setState(() {
      _isLoading = true;
    });

    isUserLoggedIn = await widget.mockApi.loginUser();

    setState(() {
      _isLoading = false;
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
            if (_isLoading) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : onPress,
              child: const Text('Login User'),
            ),
            const SizedBox(height: 8),
            Text(isUserLoggedIn ? "User logged in" : "User logged OUT")
          ],
        ),
      ),
    );
  }
}
