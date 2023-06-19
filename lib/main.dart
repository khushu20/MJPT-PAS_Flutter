import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mjpt_pas/res/Routes/App_routes.dart';
import 'package:mjpt_pas/res/routes/app_pages.dart';
import 'package:mjpt_pas/viewmodel/login_mobile_view_model.dart';
import 'package:mjpt_pas/viewmodel/login_view_model.dart';
import 'package:mjpt_pas/viewmodel/update_mpin_viewmodel.dart';
import 'package:mjpt_pas/viewmodel/validate_mpin_view_model.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        ChangeNotifierProvider(create: (_) =>UpdateMpinViewModel()),
        ChangeNotifierProvider(create: (_) =>ValidateMpinViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
        // ChangeNotifierProvider(create: (_) =>LoginMobileViewModel()),
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        title: 'My GHMC',
        initialRoute: AppRoutes.initial,
        routes: AppPages.routes,
        theme: ThemeData(
          primaryColor: Colors.black, // set primary color
          focusColor: Colors.black,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
        debugShowCheckedModeBanner: false,
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
