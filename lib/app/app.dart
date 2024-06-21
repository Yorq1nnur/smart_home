import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/bloc/country/country_bloc.dart';
import 'package:smart_home/bloc/map/map_bloc.dart';
import 'package:smart_home/bloc/my_home/my_home_bloc.dart';
import 'package:smart_home/data/repositories/country_repository.dart';
// import '../screens/routes/routes.dart';
import 'package:smart_home/screens/countries/countries_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => CountryRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CountryBloc(
              context.read<CountryRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) => MyHomeBloc(),
          ),
          BlocProvider(
            create: (_) => MapsBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
          ),
          // initialRoute: RouteNames.splashScreen,
          // onGenerateRoute: AppRoutes.generateRoute,
          home: const CountriesScreen(),
        ),
      ),
    );
  }
}
