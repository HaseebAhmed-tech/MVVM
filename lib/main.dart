import 'package:flutter/material.dart';
import 'package:mvvm_rest/utils/routes/routes.dart';
import 'package:provider/provider.dart';
import 'utils/routes/routes_name.dart';
import 'view_model/auth_view_model.dart';
import 'view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
