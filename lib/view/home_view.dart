import 'package:flutter/material.dart';
import 'package:mvvm_rest/utils/routes/routes_name.dart';
import 'package:mvvm_rest/view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userReference = UserViewModel();
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              userReference.remove().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.login, (route) => false);
              });
            },
            child: const Text('Home Screen')),
      ),
    );
  }
}
