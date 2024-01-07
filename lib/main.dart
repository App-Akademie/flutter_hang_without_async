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
    return const MaterialApp(
      title: appTitle,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  void _onPress() {
    setState(() {
      _isLoading = true;
    });
    final mockApi = MockApi();
    final isUserLoggedIn = mockApi.loginUser();

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
              onPressed: _isLoading ? null : _onPress,
              child: const Text('Start Operation'),
            ),
          ],
        ),
      ),
    );
  }
}
