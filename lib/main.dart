import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/components/constants.dart';
import '../layout/shop_layout.dart';
import '../modules/welcomes_screens/welcome_screen.dart';
import '../shared/cubit/bloc_observer.dart';
import '../shared/cubit/shop_cubit.dart';
import '../shared/network/local/cache_helper.dart';
import '../shared/network/remote/dio_helper.dart';
import '../shared/styles/themes.dart';
import '../modules/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();
  Widget shownScreenApp;
  bool? onBoardingSubmit = CacheHelper.readData(key: 'onBoarding');
  token = CacheHelper.readData(key: 'token');

  if (onBoardingSubmit != null) {
    if (token != null) {
      shownScreenApp = const ShopLayout();
    } else {
      shownScreenApp = const WelcomeScreen();
    }
  } else {
    shownScreenApp = OnBoardingScreen();
  }

  runApp(MyApp(
    startWidgetScreen: shownScreenApp,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidgetScreen;
  const MyApp({super.key, required this.startWidgetScreen});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShopApp',
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const ShopLayout(), //startWidgetScreen,
      ),
    );
  }
}
